

MessageThread.seed(:id,
    {id: 1, discussable_id: 1, discussable_type: 'user', title: 'User Thread'},
    {id: 2, discussable_id: 2, discussable_type: 'user', title: 'User Thread 2'}
)

Message.seed(:id,
           {id: 1, user_id: 1, message_thread_id: 1, text: 'lakjsdlkfjaklsjdfjlsdfklajlsdfj'},
           {id: 2, user_id: 2, message_thread_id: 1, text: 'lakjsdlkfjaklsjdfjlsdfklajlsdfj'},
           {id: 3, user_id: 1, message_thread_id: 1, text: 'lakjsdlkfjaklsjdfjlsdfklajlsdfj'},
           {id: 4, user_id: 2, message_thread_id: 1, text: 'lakjsdlkfjaklsjdfjlsdfklajlsdfj'},
           {id: 5, user_id: 1, message_thread_id: 1, text: 'lakjsdlkfjaklsjdfjlsdfklajlsdfj'},
           {id: 6, user_id: 2, message_thread_id: 1, text: 'lakjsdlkfjaklsjdfjlsdfklajlsdfj'}
)