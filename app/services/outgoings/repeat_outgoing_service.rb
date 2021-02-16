class Outgoings::RepeatOutgoingService
  def initialize(outgoing)
    @outgoing = outgoing
  end

  def repeat!
    reps = @outgoing.repeat_occurrency - 1

    reps.times do |i|
      i += 1
      due_date = set_due_date(@outgoing.repeat_period, @outgoing.due_date, i)

      Outgoing.create(
        cash_account_id:        @outgoing.cash_account_id,
        parent_id:              @outgoing.id,
        client_name:            @outgoing.client_name,
        client_identification:  @outgoing.client_identification,
        value:                  @outgoing.value,
        observations:           @outgoing.observations,
        description:            set_description(i.to_s),
        bank_account_id:        @outgoing.bank_account_id,
        kind:                   @outgoing.kind,
        split:                  false,
        repeat:                 false,
        due_date:               due_date,
        paid:                   false
      )
    end
  end

  private

    def set_due_date(period, due_date, i)
      case period
      when 'daily'
        return due_date + i.day
      when 'weekly'
        return due_date + i.week
      when 'biweekly'
        return due_date + (i * 15).days
      when 'monthly'
        return due_date + i.month
      when 'yearly'
        return due_date + i.year
      else
        return due_date
      end
    end

    def set_description(repeat_number)
      return 'Pagamento ' + repeat_number + ' de ' + @outgoing.repeat_occurrency.to_s + ' de: ' + @outgoing.description
    end
end
