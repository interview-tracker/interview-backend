class AddColumnResume < ActiveRecord::Migration
  def change
    add_attachment :resumes, :document
  end
end
