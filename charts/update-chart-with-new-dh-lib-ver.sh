currentVal=0.1.9
newVal=0.1.11
file=Chart.yaml

find ./ -iname '$file' -exec sed -i "$(yq '.dependencies.[] | select(.name == "dh-lib").version | line' '{}')s/$currentVal/$newVal/" '{}' ';'