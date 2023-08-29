@chcp 65001

call allure generate --clean .\build\vanessa\allure -o .\build\vanessa\allure\allure-report && allure open .\build\vanessa\allure\allure-report
# Для PowerShell: allure generate --clean .\out\allure .\out\smoke\allure .\out\syntax-check\allure -o .\out\allure\allure-report; allure open .\out\allure\allure-report
