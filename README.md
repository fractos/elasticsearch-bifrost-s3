# elasticsearch-bifrost-s3

ElasticSearch instance that can self-register in Route53 and comes with the `repository-s3` plugin installed.

See https://www.elastic.co/guide/en/elasticsearch/plugins/current/repository-s3.html for configuration details.

## Permissions

```
{
  "Statement": [
    {
      "Action": [
        "s3:ListBucket",
        "s3:GetBucketLocation",
        "s3:ListBucketMultipartUploads",
        "s3:ListBucketVersions"
      ],
      "Condition": {
        "StringLike": {
          "s3:prefix": [
            "foo/*"
          ]
        }
      },
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::snaps.example.com"
      ]
    },
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:AbortMultipartUpload",
        "s3:ListMultipartUploadParts"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::snaps.example.com/foo/*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
```

## Usage


## Creating the repository

```
curl -XPUT --data '{ "type": "s3", "settings": { "bucket": "<bucket name>", "base_path": "<key prefix>", "storage_class": "standard_ia" } }'  http://elasticsearch:9200/_snapshot/<repository name>
```

## Creating a snapshot

```
curl -XPUT http://elasticsearch:9200/_snapshot/<repository name>/<snapshot name>?wait_for_completion=true
```

## Get list of snapshots

```
curl http://elasticsearch:9200/_snapshot/<repository name>/_all
```
