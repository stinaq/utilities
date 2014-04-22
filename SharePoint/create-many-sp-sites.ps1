#Creates a large number of project sites

#gets webtemplate to project site
$template = Get-SPWebTemplate | Where {$_.Name -eq "{8C45641B-0F22-462C-9A90-E3F8274D5541}#BoolProjectSite" -and $_.Title -eq "Project Site" } 
$admin = "booldevlocal\administrator";
$stina = "booldevlocal\stina";

$names = "Chili", "Cloudberry", "Coconut", "Damson", "Date", "Dragonfruit", "Durian", "Elderberry", "Feijoa", "Fig", "Gooseberry", "Grape", "Grapefruit", "Guava", "Huckleberry", "Honeydew", "Jackfruit", "Jettamelon", "Jambul", "Jujube", "Kiwi fruit", "Kumquat", "Legume", "Lemon", "Lime", "Loquat", "Lychee", "Mango", "Canary melon", "Cantaloupe", "Watermelon", "Rock melon", "Nectarine", "Nut", "Orange", "Clementine", "Mandarine", "Tangerine", "Papaya", "Passionfruit", "Peach", "Pepper", "Persimmon", "Physalis", "Pineapple", "Pomegranate", "Pomelo", "Purple Mangosteen", "Quince", "Raspberry", "Rambutan", "Redcurrant", "Satsuma", "Star fruit", "Strawberry", "Tamarillo", "Tomato", "Adrastea", "Alaskahallon", "Apelsin", "Aprikos", "Aubergine", "Avokado", "Backsmultron", "BigarrÃ¥", "Bittergurka", "Bittermandel", "BjÃ¶rnbÃ¤r", "Blodpomelo", "BlÃ¥bÃ¤r", "BlÃ¥hallon", "BoysenbÃ¤r", "Brakved", "BrÃ¶dfrukt", "BÃ¤verbÃ¤r", "Blodapelsin", "CashewnÃ¶t", "Cayennepeppar", "Charantais", "Chilipeppar", "Citron", "Dadel", "Drakfrukt", "DruvflÃ¤der", "DvÃ¤rgapelsin", "Ekollon", "EkorrbÃ¤r", "EnbÃ¤r", "Fikonkaktus", "FjÃ¤llodon", "FlÃ¤der", "Fotblad", "Galiamelon", "GranatÃ¤pple", "Grapefrukt", "Greve moltke", "Gul kiwi", "Gurka", "Hagtorn", "Hallon", "HasselnÃ¶t", "Hirskorn", "Hjortron", "Honungsmelon", "Indiskt marmeladtrÃ¤d", "Japansk dvÃ¤rgapelsin", "Jordgubbe", "JordnÃ¶t";

foreach($site in $names)
{
    Write-Host "Now creating site " + $site;

    $url = "http://dev/projects/" + $site

    $newSite = New-SPSite -Url $url -OwnerAlias $admin -SecondaryOwnerAlias $stina -Template $template -Name $site;

    #To add members to site
    $newSite.RootWeb.CreateDefaultAssociatedGroups($admin, $admin, $newSite.Title);

}

