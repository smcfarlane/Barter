

User.seed(:id,
          { :id => 1, :email => "jon@example.com",   :password => 'jon', :password_confirmation => 'jon'  },
          { :id => 2, :email => "emily@example.com", :password => 'emily', :password_confirmation => 'emily' },
          { :id => 3, :email => "joe@example.com", :password => 'joe', :password_confirmation => 'joe' }
)

UserInfo.seed(:id,
              {id: 1, first_name: 'jon', last_name: 'doe', user_id: 1},
              {id: 2, first_name: 'emily', last_name: 'doe', user_id: 2},
              {id: 3, first_name: 'joe', last_name: 'doe', user_id: 3}
)

ContactInfo.seed(:id,
              {id: 1, user_infos_id: 1, street_address: '123 A St', city: 'San Diego', state: 'CA', zip: '90000', phone: '5555555555', email: 'jon@example.com', website: 'jon.com'},
                 {id: 2, user_infos_id: 2, street_address: '123 B St', city: 'San Diego', state: 'CA', zip: '90000', phone: '4445555555', email: 'emily@example.com', website: 'emily.com'},
                 {id: 3, user_infos_id: 3, street_address: '123 C St', city: 'San Diego', state: 'CA', zip: '90000', phone: '6665555555', email: 'joe@example.com', website: 'joe.com'}
)