class User < ApplicationRecord
  validates :firstname, :lastname, :age, :sex, presence: true

  def self.import_file_data(filepath)
    xlsx = Roo::Excelx.new(filepath)
    users = []
    xlsx.each_row_streaming.each_with_index do|row, index|
      next if index.zero?
      users.push({firstname: row[0].value, lastname: row[1].value, age: row[2].value, sex: row[3].value})
    end
    User.create(users)
  end
end
