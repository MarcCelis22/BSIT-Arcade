# Reflection Draft

While planning the pages, it showed me that a game needs clear links to both a developer and a category, and that the review, version, and session tables need to remain as related history records. I did not need to change the 6-table schema, because the original columns already mapped to the planned screens and form controls.

For one `games` record, the form will send `title`, `developer_id`, and `category_id` through PHP using `$_POST`, then PHP will validate the values and use an `INSERT` or `UPDATE` statement on MySQL or PostgreSQL. JavaScript may provide immediate required-field checks and improve feedback, but PHP must remain responsible for server-side validation and database access. The list page will receive the saved record from a query and render it as a table row.

I am least sure about balancing developer permissions and public read access, especially which delete actions should be real deletes versus retained history. In Week 15 I will confirm the ownership rules, add server-side authorization, and test the forms and foreign-key fields before implementing actions. I used an AI assistant to organize my spaghetti code. I reviewed, corrected, and added to the generated design rather than submitting it unchanged.
