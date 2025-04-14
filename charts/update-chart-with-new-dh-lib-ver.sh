currentVal=0.1.14
newVal=0.1.15
file=Chart.yaml

find ./ -iname "$file" -exec sed -i "$(yq '.dependencies.[] | select(.name == "dh-lib").version | line' '{}')s/$currentVal/$newVal/" '{}' ';'