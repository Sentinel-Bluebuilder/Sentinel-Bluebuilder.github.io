$ProgressPreference = 'SilentlyContinue'
$out = "$PSScriptRoot\..\public\logos\payments"
New-Item -ItemType Directory -Force -Path $out | Out-Null

$logos = @{
  'stripe.svg'    = 'https://cdn.simpleicons.org/stripe/635bff'
  'bitcoin.svg'   = 'https://cdn.simpleicons.org/bitcoin/f7931a'
  'ethereum.svg'  = 'https://cdn.simpleicons.org/ethereum/627eea'
  'usdc.svg'      = 'https://cdn.simpleicons.org/circle/2775ca'
  'coinbase.svg'  = 'https://cdn.simpleicons.org/coinbase/0052ff'
  'moonpay.svg'   = 'https://cdn.simpleicons.org/moonpay/7d00ff'
  'applepay.svg'  = 'https://cdn.simpleicons.org/applepay/ffffff'
  'googlepay.svg' = 'https://cdn.simpleicons.org/googlepay/ffffff'
}

foreach ($k in $logos.Keys) {
  $url = $logos[$k]
  $dest = Join-Path $out $k
  Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing
  Write-Host "saved $k"
}
