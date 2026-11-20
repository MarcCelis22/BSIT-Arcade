# CRUD Map

Table           | C | R | U  | D | Pages                             | Who
                |   |   |    |   |                                   |
`users`         | ✓ | ✓ | ✓ | – | register, profile                 | Self: C, R, U; Faculty: R
`categories`    | ✓ | ✓ | ✓ | ✓ | categories-list, category-form    | Faculty/admin only
`games`         | ✓ | ✓ | ✓ | ✓ | game-list, game-detail, game-form | Guest: R; Student: R; Developer: C, R, U own, D own; Faculty: R, U, D
`game_versions` | ✓ | ✓ | ✓ | – | game-detail, version-form         | Developer: C, R, U own; Guest/Student: R
`reviews`       | ✓ | ✓ | ✓ | – | game-detail, review-form          | Student: C, R, U own; Guest: R; Faculty: R
`game_sessions` | ✓ | ✓ | – | – | play-session-form, game-detail     | Student: C, R own; Developer/Faculty: R summary

Dashes mean the action is not offered: `users` are deactivated rather than deleted, `game_versions` remain as release history, `reviews` remain auditable feedback, and gameplay sessions remain play history. Any future deletion would need to be handled carefully because of foreign-key links.

## Form fields: `games`

Column         | Form control                                         | Required?
               |                                                      |
`game_id`      | Hidden field on edit; omitted on add                 | No; generated
`developer_id` | `<select>` of developer names, developer ID as value | Yes
`category_id`  | `<select>` of category names, category ID as value   | Yes
`title`        | `<input type="text" maxlength="150">`                | Yes
`created_at`   | None on add/edit                                     | No; database default

## Form fields: `game_versions`

Column           | Form control                                | Required?
                 |                                             |
`version_id`     | Hidden field on edit; omitted on add        | No; generated
`game_id`        | `<select>` of game titles, game ID as value | Yes
`version_number` | `<input type="text" maxlength="20">`        | Yes
`download_url`   | `<input type="url" maxlength="500">`        | Yes
`uploaded_at`    | None on add/edit                            | No; database default

## Schema changes

None. Planning confirmed the 6-table BCNF schema is sufficient for the static prototype and final CRUD features.
