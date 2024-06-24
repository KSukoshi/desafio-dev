class FileParser
  def initialize(file_path)
    @file_path = file_path
  end

  def parse
    File.foreach(@file_path).with_index do |line, index|
      line_number = index + 1
          line.chomp!
          line_length = line.size
          if line_length != 80
            puts "Line #{line_number} is not 80 characters long"
            invalid_lines << line_number
            next
          end

      payment_type = line[0].to_i

      # Find the corresponding PaymentMethod by payment_type
      payment_method = PaymentMethod.find_by(id: payment_type)

      if payment_method.present?
        transaction_date = Date.strptime(line[1..8], '%Y%m%d')
        value = line[9..18].to_f / 100
        cpf = line[19..29]
        payment_card = line[30..41]
        payment_at = Time.strptime(line[42..47], '%H%M%S')
        store_owner = line[48..61].strip
        store_name = line[62..80].strip
          
        PaymentTransaction.create!(
          payment_method_id: payment_method.id,
          transaction_date: transaction_date,
          value: value,
          cpf: cpf,
          payment_card: payment_card,
          paid_at: payment_at,
          store_owner: store_owner,
          store_name: store_name
        )
      else
        # Handle case where payment_method does not exist (e.g., log error, skip transaction)
        puts "Payment method with ID #{payment_type} not found."
        # You might want to log this or handle it differently based on your application's requirements
      end
    end
  end
end