require 'twitter/rate_limit'

module Twitter
  # Custom error class for rescuing from all Twitter errors
  class Error < StandardError
    # @return [Integer]
    attr_reader :code
    # @return [Twitter::RateLimit]
    attr_reader :rate_limit

    # If error code is missing see https://dev.twitter.com/docs/error-codes-responses
    module Code
      AUTHENTICATION_PROBLEM       =  32
      RESOURCE_NOT_FOUND           =  34
      SUSPENDED_ACCOUNT            =  64
      DEPRECATED_CALL              =  68
      RATE_LIMIT_EXCEEDED          =  88
      INVALID_OR_EXPIRED_TOKEN     =  89
      SSL_REQUIRED                 =  92
      UNABLE_TO_VERIFY_CREDENTIALS =  99
      OVER_CAPACITY                = 130
      INTERNAL_ERROR               = 131
      OAUTH_TIMESTAMP_OUT_OF_RANGE = 135
      ALREADY_FAVORITED            = 139
      FOLLOW_ALREADY_REQUESTED     = 160
      FOLLOW_LIMIT_EXCEEDED        = 161
      PROTECTED_STATUS             = 179
      OVER_UPDATE_LIMIT            = 185
      DUPLICATE_STATUS             = 187
      BAD_AUTHENTICATION_DATA      = 215
      LOGIN_VERIFICATION_NEEDED    = 231
      ENDPOINT_RETIRED             = 251
    end
    Codes = Code # rubocop:disable ConstantName

    class << self
      # Create a new error from an HTTP response
      #
      # @param response [Faraday::Response]
      # @return [Twitter::Error]
      def from_response(response)
        message, code = parse_error(response.body)
        new(message, response.response_headers, code)
      end

      # @return [Hash]
      def errors
        @errors ||= {
          400 => Twitter::Error::BadRequest,
          401 => Twitter::Error::Unauthorized,
          403 => Twitter::Error::Forbidden,
          404 => Twitter::Error::NotFound,
          406 => Twitter::Error::NotAcceptable,
          408 => Twitter::Error::RequestTimeout,
          420 => Twitter::Error::EnhanceYourCalm,
          422 => Twitter::Error::UnprocessableEntity,
          429 => Twitter::Error::TooManyRequests,
          500 => Twitter::Error::InternalServerError,
          502 => Twitter::Error::BadGateway,
          503 => Twitter::Error::ServiceUnavailable,
          504 => Twitter::Error::GatewayTimeout,
        }
      end

      def forbidden_messages
        @forbidden_messages ||= {
          'Status is a duplicate.' => Twitter::Error::DuplicateStatus,
          'You have already favorited this status.' => Twitter::Error::AlreadyFavorited,
          'sharing is not permissible for this status (Share validations failed)' => Twitter::Error::AlreadyRetweeted,
        }
      end

    private

      def parse_error(body)
        if body.nil?
          ['', nil]
        elsif body[:error]
          [body[:error], nil]
        elsif body[:errors]
          extract_message_from_errors(body)
        end
      end

      def extract_message_from_errors(body)
        first = Array(body[:errors]).first
        if first.is_a?(Hash)
          [first[:message].chomp, first[:code]]
        else
          [first.chomp, nil]
        end
      end
    end

    # Initializes a new Error object
    #
    # @param message [Exception, String]
    # @param rate_limit [Hash]
    # @param code [Integer]
    # @return [Twitter::Error]
    def initialize(message = '', rate_limit = {}, code = nil)
      super(message)
      @rate_limit = Twitter::RateLimit.new(rate_limit)
      @code = code
    end

    ConfigurationError = Class.new(::ArgumentError)

    # Raised when a Tweet includes media that doesn't have a to_io method
    class UnacceptableIO < StandardError
      def initialize
        super('The IO object for media must respond to to_io')
      end
    end

    # Raised when Twitter returns a 4xx HTTP status code
    ClientError = Class.new(self)

    # Raised when Twitter returns the HTTP status code 400
    BadRequest = Class.new(ClientError)

    # Raised when Twitter returns the HTTP status code 401
    Unauthorized = Class.new(ClientError)

    # Raised when Twitter returns the HTTP status code 403
    Forbidden = Class.new(ClientError)

    # Raised when a Tweet has already been favorited
    AlreadyFavorited = Class.new(Forbidden)

    # Raised when a Tweet has already been retweeted
    AlreadyRetweeted = Class.new(Forbidden)

    # Raised when a Tweet has already been posted
    DuplicateStatus = Class.new(Forbidden)
    AlreadyPosted = DuplicateStatus # rubocop:disable ConstantName

    # Raised when Twitter returns the HTTP status code 404
    NotFound = Class.new(ClientError)

    # Raised when Twitter returns the HTTP status code 406
    NotAcceptable = Class.new(ClientError)

    # Raised when Twitter returns the HTTP status code 408
    RequestTimeout = Class.new(ClientError)

    # Raised when Twitter returns the HTTP status code 422
    UnprocessableEntity = Class.new(ClientError)

    # Raised when Twitter returns the HTTP status code 429
    TooManyRequests = Class.new(ClientError)
    EnhanceYourCalm = TooManyRequests # rubocop:disable ConstantName
    RateLimited = TooManyRequests # rubocop:disable ConstantName

    # Raised when Twitter returns a 5xx HTTP status code
    ServerError = Class.new(self)

    # Raised when Twitter returns the HTTP status code 500
    InternalServerError = Class.new(ServerError)

    # Raised when Twitter returns the HTTP status code 502
    BadGateway = Class.new(ServerError)

    # Raised when Twitter returns the HTTP status code 503
    ServiceUnavailable = Class.new(ServerError)

    # Raised when Twitter returns the HTTP status code 504
    GatewayTimeout = Class.new(ServerError)
  end
end
