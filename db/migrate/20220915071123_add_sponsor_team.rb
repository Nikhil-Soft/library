class AddSponsorTeam < ActiveRecord::Migration[7.0]
  def change
    create_table :sponsors_teams , id: false do |t|
      t.belongs_to :team
      t.belongs_to :sponsor
    end
  end
end
