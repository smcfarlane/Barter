module ApplicationHelper
  def thread_data_json thread_id
    ActiveRecord::Base.connection.execute( <<-SQL
SELECT
  array_to_json(array_agg(row_to_json(thread)))
FROM
  (
    SELECT title, (
      SELECT array_to_json(array_agg(row_to_json(m)))
      FROM (
      SELECT messages.user_id, email, first_name, last_name, text
      FROM messages
        JOIN users ON messages.user_id = users.id
        JOIN user_infos ON messages.user_id = user_infos.user_id
      WHERE message_thread_id = #{thread_id}
    ) m
  ) as messages
   FROM message_threads WHERE message_threads.id = #{thread_id}) thread
    SQL
)
  end

  def thread_data thread_id
    data = ActiveRecord::Base.connection.execute( <<-SQL
SELECT
thread
FROM
(
SELECT title, (
SELECT array_agg(m)
FROM (
SELECT messages.user_id, email, first_name, last_name, text
FROM messages
JOIN users ON messages.user_id = users.id
JOIN user_infos ON messages.user_id = user_infos.user_id
WHERE message_thread_id = #{thread_id}
) m
) as messages
FROM message_threads WHERE message_threads.id = #{thread_id}) thread
    SQL
    )
    data
  end

end
