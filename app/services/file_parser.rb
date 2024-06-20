class FileParser
    def initialize(file_path)
      @file_path = file_path
    end
  
    def parse
      File.foreach(@file_path) do |line|
        payment_type = line[0].to_i
        transaction_date = Date.strptime(line[1..8], '%Y%m%d')
        value = line[9..18].to_f / 100
        cpf = line[19..29]
        payment_card = line[30..41]
        payment_at = Time.strptime(line[42..47], '%H%M%S')
        store_owner = line[48..61].strip
        store_name = line[62..80].strip
  
        PaymentTransaction.create!(
          payment_method_id: payment_type,
          transaction_date: transaction_date,
          value: value,
          cpf: cpf,
          payment_card: payment_card,
          payed_at: payment_at,
          store_owner: store_owner,
          store_name: store_name
        )
      end
    end
  end