# Praktiskais darbs — PowerShell skriptēšana

Šo failu jāpapildina ar **reālo** izvadu novērojumiem no sava datora; nedrīkst izdomāt sistēmas faktus.

## 01. Sistēmas apraksts
Datora nosaukums bija [...], Windows būvējums [...], PowerShell versija [...], un mērījuma laikā darbojās [...] procesi.

## 02. Procesi pēc atmiņas
Desmit lielāko procesu sarakstā visvairāk atmiņas patērēja [...] — [...] MB. Atmiņas īpašības nosaukumu `WorkingSet64` pārbaudīju ar `Get-Member`.

## 03. Servisi
Darbojās [...] servisi, apturēti bija [...], summa [...]; kopā iegūti [...]. Summa [sakrīt/nesakrīt], jo [nav citu statusu / ir citas pārejas statusu vērtības, piemēram, StartPending].

## 04. Automātiskie servisi
Atradu [...] automātiskus, apturētus servisus. `-WhatIf` režīmā tie netika palaisti. Pēc īstās palaišanas [...]. [Administratora tiesības bija/ne-bija nepieciešamas; kļūdu gadījumā norādīt iemeslu.]

## 05. Sistēmas žurnāla kļūdas
Pēdējās 48 stundās bija [...] kļūdu ieraksti; biežākais avots [...]. Tas ļauj secināt [...], bet kļūdu skaits pats par sevi nepierāda bojājumu.

## 06. Draiveri
CSV failā bija [...] draiveru datu rindas. Izvēlētais draiveris [...] pieder ierīcei [...]; informāciju pārbaudīju [...].

## 07. Diska vieta
Diskam [...] bija [...] GB brīvas vietas; brīdinājuma slieksnis ir 20 GB, tādēļ [brīdinājums parādījās/neparādījās].

## 08. Divi servisa meklēšanas veidi
`Get-Service` aizņēma [...] ms, `Get-CimInstance` [...] ms. Šajā mērījumā ātrāks bija [...]; starpība [...] ms [ir/nav] nozīmīga ikdienas darbā. Vienam mērījumam var būt nejaušas svārstības.

## 09. Procesu īpašnieki
Bez administratora tiesībām lietotāju izdevās noteikt [...] procesiem, bet [...] gadījumos parādījās [...]. Daļai sistēmas procesu piekļuve var būt ierobežota. `Get-Process` vien nepiedāvā visu procesu īpašniekus; šeit izmantota WMI/CIM metode `GetOwner`.

## 10. Kopsavilkums
Salīdzinot ar 01., 03., 05. un 07. uzdevumu, mainījās [...]. Atšķirības var rasties, jo mainās darbojošies procesi, servisi, sistēmas žurnāls un brīvā diska vieta.

## 11. Tīkla adapteri
Aktīvie adapteri bija [...], neaktīvie [...]. Statuss var būt atkarīgs no tā, vai ir pieslēgts kabelis, ir ieslēgts Wi-Fi, kā arī no virtuālajiem adapteriem.
