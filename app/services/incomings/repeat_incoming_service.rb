class Incomings::RepeatIncomingService
  def initialize(incoming)
    @incoming = incoming
  end

  def repeat!
    reps = @incoming.repeat_occurrency - 1

    reps.times do |i|
      i += 1
      due_date = set_due_date(@incoming.repeat_period, @incoming.due_date, i)

      Incoming.create(
        cash_account_id:        @incoming.cash_account_id,
        parent_id:              @incoming.id,
        client_name:            @incoming.client_name,
        client_identification:  @incoming.client_identification,
        value:                  @incoming.value,
        observations:           @incoming.observations,
        description:            set_description(i.to_s),
        bank_account_id:        @incoming.bank_account_id,
        kind:                   @incoming.kind,
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
      return 'Pagamento ' + repeat_number + ' de ' + @incoming.repeat_occurrency.to_s + ' de: ' + @incoming.description
    end
end
