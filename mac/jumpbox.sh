#!/usr/bin/expect
set otp_code [exec /usr/local/bin/python3 -c "import pyotp;totp=pyotp.TOTP(\"$env(OTP_SECRET)\");print(\"%s\" % (totp.now()))"]

spawn /usr/bin/ssh jumpbox
expect {
    "OTP Code" {send "$otp_code\n";interact}
    "@" {interact}
}
