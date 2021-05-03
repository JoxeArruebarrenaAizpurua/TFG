import sqlite3, requests, csv, bs4
from datetime import datetime

with open('companiesList.csv', newline='') as file:
    reader = csv.reader(file)
    companiesList = list(reader)

con = sqlite3.connect('companies_historical_info.sqlite')

counter = 0
company = 0
errorCompanies = ['ACS.MC', 'ACX.MC', 'AENA.MC', 'ALL', 'ALM.MC', 'AMS.MC', 'AMZN', 'ANA.MC', 'AZO', 'BBVA.MC', 'BKNG', 'BKT.MC', 'CABK.MC', 'CIE.MC', 'CLNX.MC', 'CMG', 'COL.MC', 'ELE.MC', 'FDR.MC', 'FER.MC', 'GOOG', 'GOOGL', 'GRF.MC', 'IAG.MC', 'IBE.MC', 'IDR.MC', 'ITX.MC', 'MAP.MC', 'MEL.MC', 'MELI', 'MRL.MC', 'MTD', 'MTS.MC', 'NTGY.MC', 'NVR', 'PHM.MC', 'REE.MC', 'REP.MC', 'SAB.MC', 'SAN.MC', 'SGRE.MC', 'SLR.MC', 'TEF.MC', 'VAR', 'VIS.MC']
for i in companiesList:
    companiesData = i
    if counter != 0 and counter > company and i[1] not in errorCompanies:
        with open('Companies_CSV/' + i[1] + '.csv', newline='') as file:
            reader = csv.reader(file)
            historicalInfo = list(reader)

        url = 'https://finance.yahoo.com/quote/'+ i[1] +'/history?p=' + i[1]

        page = requests.get(url).text
        soup = bs4.BeautifulSoup(page, 'html.parser')

        infoTable = soup.find('table')
        tableSections = infoTable.find_all('tr')
        
        for j in range(1, 0, -1):
            dailyInfoList = []
            dailyInfo = tableSections[j].find_all('td')

            date = dailyInfo[0].text
            dateDigit = datetime.strptime(date, '%b %d, %Y')
            year = str(dateDigit.year)

            if len(str(dateDigit.month)) == 1:
                month = '0' + str(dateDigit.month)
            else:
                month = str(dateDigit.month)

            if len(str(dateDigit.day)) == 1:
                day = '0' + str(dateDigit.day)
            else:
                day = str(dateDigit.day)

            finalDate = year + '-' + month + '-' + day
            finalDateSql = '"' + year + '-' + month + '-' + day + '"'
            dailyInfoList.append(finalDate)

            openValue = dailyInfo[1].text
            dailyInfoList.append(openValue)

            high = dailyInfo[2].text
            dailyInfoList.append(high)

            low = dailyInfo[3].text
            dailyInfoList.append(low)

            close = dailyInfo[4].text
            dailyInfoList.append(close)

            adjClose = dailyInfo[5].text
            dailyInfoList.append(adjClose)

            volume = dailyInfo[6].text
            finalVolume = ''
            for j in volume:
                if j != ',':
                    finalVolume = finalVolume + j

            dailyInfoList.append(finalVolume)

            historicalInfo.append(dailyInfoList)

            try:
                cursorObj = con.cursor()
                cursorObj.execute("INSERT INTO " + i[1] + 
                                " VALUES(" + finalDateSql + ", " + openValue + ", " + 
                                high + ", " + low + ", " + close + ", " + adjClose 
                                + ", " + finalVolume + ")")
                con.commit()

                with open('Companies_CSV/' + i[1] + '.csv', 'w', newline='') as file:
                    writer = csv.writer(file)
                    writer.writerows(historicalInfo)
            
            except:
                print(i[1])

    
    counter += 1