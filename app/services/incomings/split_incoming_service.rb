class Incomings::SplitIncomingService
  def initialize(incoming)
    @incoming = incoming
  end

  def split!
    split_values = set_split_values
    @incoming.value = @incoming.upfront_payment || split_values

    splits = @incoming.split_quantity - 1

    splits.times do |i|
      i += 1
      Incoming.create(
        cash_account_id:        @incoming.cash_account_id,
        parent_id:              @incoming.id,
        client_name:            @incoming.client_name,
        client_identification:  @incoming.client_identification,
        value:                  split_values,
        observations:           @incoming.observations,
        description:            set_description(i.to_s),
        bank_account_id:        @incoming.bank_account_id,
        kind:                   @incoming.kind,
        split:                  false,
        repeat:                 false,
        due_date:               @incoming.due_date + i.month,
        paid:                   false
      )
    end

    @incoming.save
  end

  private

    def set_split_values
      if @incoming.upfront_payment.present?
        values = (@incoming.value - @incoming.upfront_payment) / (@incoming.split_quantity - 1)
      else
        values = @incoming.value / @incoming.split_quantity
      end
      return values
    end

    def set_description(split_number)
      return 'Parcela ' + split_number + ' do pagamento: ' + @incoming.description
    end
end
