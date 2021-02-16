class Outgoings::SplitOutgoingService
  def initialize(outgoing)
    @outgoing = outgoing
  end

  def split!
    split_values = set_split_values
    @outgoing.value = @outgoing.upfront_payment || split_values

    splits = @outgoing.split_quantity - 1

    splits.times do |i|
      i += 1
      Outgoing.create(
        cash_account_id:        @outgoing.cash_account_id,
        parent_id:              @outgoing.id,
        client_name:            @outgoing.client_name,
        client_identification:  @outgoing.client_identification,
        value:                  split_values,
        observations:           @outgoing.observations,
        description:            set_description(i.to_s),
        bank_account_id:        @outgoing.bank_account_id,
        kind:                   @outgoing.kind,
        split:                  false,
        repeat:                 false,
        due_date:               @outgoing.due_date + i.month,
        paid:                   false
      )
    end

    @outgoing.save
  end

  private

    def set_split_values
      if @outgoing.upfront_payment.present?
        values = (@outgoing.value - @outgoing.upfront_payment) / (@outgoing.split_quantity - 1)
      else
        values = @outgoing.value / @outgoing.split_quantity
      end
      return values
    end

    def set_description(split_number)
      return 'Parcela ' + split_number + ' do pagamento: ' + @outgoing.description
    end
end
