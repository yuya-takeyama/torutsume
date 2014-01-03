class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :text

  def self.find_by_text_id_and_commit_id_and_line_number(text_id, commit_id, line_number)
    self.where(text_id: text_id, commit_id: commit_id, line_number: line_number)
  end
end
