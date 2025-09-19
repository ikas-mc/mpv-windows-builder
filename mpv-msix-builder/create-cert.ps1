# run this script to create a self-signed certificate and export it to a .pfx
# change xxx to your values first
$subject = "CN=mpv-unofficial"
$friendlyName = "mpv"
$pw= "xxx"

$cert = New-SelfSignedCertificate `
    -Type Custom `
    -KeyUsage DigitalSignature `
    -CertStoreLocation "Cert:\CurrentUser\My" `
    -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}") `
    -Subject "$subject" `
    -FriendlyName "$friendlyName"

Write-Host "Created certificate:"
Write-Host "Subject: $($cert.Subject)"
Write-Host "Thumbprint: $($cert.Thumbprint)"

$password = ConvertTo-SecureString -String $pw -Force -AsPlainText
Export-PfxCertificate -cert $cert.PSPath -FilePath "$friendlyName.pfx" -Password $password

Write-Host "Certificate exported to $friendlyName.pfx"

Remove-Item -Path $cert.PSPath -DeleteKey
Write-Host "Certificate removed from store"