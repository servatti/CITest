dateFormatted=$(date +"%a, %d %b %Y %T %z")
s3Bucket="mytop"
fileName=$1
relativePath="/${s3Bucket}/${fileName}"
contentType="application/octet-stream"
stringToSign="PUT\n\n${contentType}\n${dateFormatted}\n${relativePath}"
s3AccessKey="AKIAJ2IZUCL5NKMVR5ZQ"
s3SecretKey="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"
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3SecretKey} -binary | base64`
curl -X PUT -T "${fileName}" \
-H "Host: ${s3Bucket}.s3.amazonaws.com" \
-H "Date: ${dateFormatted}" \
-H "Content-Type: ${contentType}" \
-H "Authorization: AWS ${s3AccessKey}:${signature}" \
 https://${s3Bucket}.s3.amazonaws.com/${fileName}
