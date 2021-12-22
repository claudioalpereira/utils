mkdir d:\alljars\$(hostname)
mkdir c:\alljars\$(hostname)
xcopy d:\*.jar  c:\alljars\$(hostname)\ /sy
xcopy c:\alljars\ d:\alljars\ /sy
rd -r c:\alljars
xcopy c:\*.jar  d:\alljars\$(hostname)\ /sy
Get-ChildItem -Path .\ -Filter *.jar -Recurse -File -Name | Select-Object > d:\alljars\$(hostname)\manifest.txt
aws s3 sync d:\alljars\ s3://smo-log4j-test/
rd -r d:\alljars
rm $ENV:UserProfile\.aws\credentials
