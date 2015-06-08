

User.seed(:id,
          {id: 1, email: "jon@example.com",   password: 'jon', password_confirmation: 'jon'},
          {id: 2, email: "emily@example.com", password: 'emily', password_confirmation: 'emily'},
          {id: 3, email: "joe@example.com", password: 'joe', password_confirmation: 'joe'}
)

UserInfo.seed(:id,
              {id: 1, first_name: 'jon', last_name: 'doe', user_id: 1},
              {id: 2, first_name: 'emily', last_name: 'doe', user_id: 2},
              {id: 3, first_name: 'joe', last_name: 'doe', user_id: 3}
)

Address.seed(:id,
        {id: 1, street_address: '123 S St', city: 'San Diego', state: 'CA', zip: '90000', user_id: 1}
)

# , user_info: {id: 1, first_name: 'Jon', last_name: 'Smith', user_id: 1}, addresses: {id: 1, street_address: '123 S St', city: 'San Diego', state: 'CA', zip: '90000', user_id: 1}, phones: {id: 1, phone: '4445556666'}