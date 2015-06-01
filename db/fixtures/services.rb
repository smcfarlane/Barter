

Category.seed(:id,
              {id: 1, category: 'Handyman'},
              {id: 2, category: 'designer'},
)

Service.seed(:id,
          {id: 1, user_id: 1, name: 'Handyman', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a diam nec ante feugiat accumsan et ut turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce volutpat, sapien ut ultricies aliquam, nulla dui tempor mauris, in consequat turpis magna non turpis. Nunc tellus eros, tincidunt et dapibus a, sollicitudin at orci. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam varius risus velit, eu fringilla ligula aliquet mattis.', category_id: 1, location: 1},
             {id: 2, user_id: 2, name: 'designer', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a diam nec ante feugiat accumsan et ut turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce volutpat, sapien ut ultricies aliquam, nulla dui tempor mauris, in consequat turpis magna non turpis. Nunc tellus eros, tincidunt et dapibus a, sollicitudin at orci. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam varius risus velit, eu fringilla ligula aliquet mattis.', category_id: 2, location: 2},
             {id: 3, user_id: 3, name: 'landscaper', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a diam nec ante feugiat accumsan et ut turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce volutpat, sapien ut ultricies aliquam, nulla dui tempor mauris, in consequat turpis magna non turpis. Nunc tellus eros, tincidunt et dapibus a, sollicitudin at orci. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam varius risus velit, eu fringilla ligula aliquet mattis.', category_id: 1, location: 3},
)