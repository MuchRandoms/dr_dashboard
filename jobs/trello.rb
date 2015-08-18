require 'trello'
require 'yaml'

include Trello

#TODO:  Using a YAML file right now.  Need to do something more elegant with environment variables down the road.  This is a make it work for now

@config_data

yamlFile = "./jobs/environment_variables.yaml"
if File.exist?(yamlFile)
  @config_data = YAML.load_file(yamlFile)
end

#TODO:  Using personal account details for this.  Should set up a more limited scope account that can read lots and touch little
Trello.configure do |config|
  config.developer_public_key = @config_data[:TRELLO_DEV_PUB_KEY]
  config.member_token = @config_data[:TRELLO_MEMBER_TOKEN]
end

#TODO:  This should be an array of boards, just using one for now for until a later iteration
boards = {
    "my-trello-board" => @config_data[:TRELLO_BOARD]
}

class MyTrello
  def initialize(widget_id, board_id)
    @widget_id = widget_id
    @board_id = board_id
  end

  def widget_id()
    @widget_id
  end

  def board_id()
    @board_id
  end

  def status_list()
    status = Array.new
    Board.find(@board_id).lists.each do |list|
      status.push({label: list.name, value: list.cards.size})
    end
    status
  end
end

@MyTrello = []
boards.each do |widget_id, board_id|
  begin
    @MyTrello.push(MyTrello.new(widget_id, board_id))
  rescue Exception => e
    puts e.to_s
  end
end

SCHEDULER.every '5m', :first_in => 0 do |job|
  @MyTrello.each do |board|
    status = board.status_list()
    send_event(board.widget_id, { :items => status })
  end
end