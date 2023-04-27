# Working with JSON content

## Using jq, make sure it's installed

```bash
#!/bin/sh

if [ -z $(which jq) ]; then
    # jq not yet installed, install it
    printf "\n\033[0;36mInstall jq\033[0m\n"
    sudo apt-get update && sudo apt-get -y install jq
fi
```

## JSON lint

```bash
echo '{"AssetId":"14462955","Name":"Cultural Item"}' | jq '.'
```

Output:

```json
{
  "AssetId": "14462955",
  "Name": "Cultural Item"
}
```

## Get the list of keys

```bash
echo '{"AssetId":"14462955","Name":"Cultural Item"}' | jq -r '. | keys[]' | 
while IFS= read -r value; do
    echo "The key is $value"
done
```

Output:

```txt
The key is AssetId
The key is Name
```

## Get the list and keys

```bash
echo '{"AssetId":"14462955","Name":"Cultural Item"}' | jq -r 'to_entries | map(.key + " has value " + (.value | tostring)) | .[]'
```

or

```bash
echo '{"AssetId":"14462955","Name":"Cultural Item"}' | jq -r 'to_entries | map(.key + "|" + (.value | tostring)) | .[]' | \
    while IFS='|' read key value; do
        echo "$key has value $value"
    done
```

Output:

```text
AssetId has value 14462955
Name has value Cultural Item
```
