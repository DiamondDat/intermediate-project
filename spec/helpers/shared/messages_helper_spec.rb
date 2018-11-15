require 'rails_helper'

RSpec.describe Shared::MessagesHelper, type: :helper do
  context '#remove_link_to_messages' do
    it "remove more messages path" do
      assign(:is_messenger, 'false')
      assign(:messages_to_display_offset, 0)
      expect(helper.remove_link_to_messages).to (
        eq 'shared/load_more_messages/window/remove_more_messages_link'
      )
    end

    it "returns an empty partial's path" do
      assign(:messages_to_display_offset, 1)
      expect(helper.remove_link_to_messages).to (
        eq 'shared/empty_partial'
      )
    end

    it "returns an empty partial's path" do
      assign(:is_messenger, 'true')
      expect(helper.remove_link_to_messages).to (
        eq 'shared/empty_partial'
      )
    end
  end
end
