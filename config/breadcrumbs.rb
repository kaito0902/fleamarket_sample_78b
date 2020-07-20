# Root crumb
crumb :root do
  link "フリマ", root_path
end

# Issue list
crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :bookmark do |bookmark|
  link "いいね商品一覧", bookmarks_mypages_path(bookmark)
  parent :mypage
end
# crumb : do
#   link "お知らせ", _path
#   parent :mypage
# end

# crumb :show do
#   link "出品した商品", _path
#   parent :mypage
# end

# crumb : do
#   link "出品した商品 - 売却済み", _path
#   parent :mypage
# end

# crumb : do
#   link "購入した商品", _path
#   parent :mypage
# end

# crumb : do
#   link "ニュース一覧", _path
#   parent :mypage
# end

# crumb : do
#   link "お問い合わせ", _path
#   parent :mypage
# end

# crumb : do
#   link "クレジットカード情報 編集", _path
#   parent :mypage
# end

# crumb : do
#   link "発送元・お届け先住所変更", _path
#   parent :mypage
# end

# crumb : do
#   link "ログアウト", _path
#   parent :mypage
# end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).