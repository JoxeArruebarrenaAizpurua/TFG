import csv_to_sqlite, csv

with open('companiesList.csv', newline='') as file:
    reader = csv.reader(file)
    companiesList = list(reader)

options = csv_to_sqlite.CsvOptions(typing_style='full',encoding='windows-1250')
inputFiles = []
for i in companiesList:
    if i[1] != 'Ticker':
        companyCsv = 'Companies_CSV/' + i[1] + '.csv'
        inputFiles = [companyCsv]
        #inputFiles.append(companyCsv)

        csv_to_sqlite.write_csv(inputFiles, 'companies_historical_info.sqlite', options)
