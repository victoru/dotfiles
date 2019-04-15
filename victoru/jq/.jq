def parse_db_info:
  .Parameters as $params
  | ($params | map(select(.Name | endswith("/host")) | .Name | capture("/(?<env>.*)/rds/(?<db>.*)/host"))) as $dbs
  | reduce $dbs[] as $item ({}; .["\($item.env)"] += ($item | $item.db as $db | $item.env as $env
  | (first($params[] | select(.Name | endswith($db + "/host")))) as $db_host
  | (first($params[] | select(.Name | endswith($db + "/port")))) as $db_port
  | (first($params[] | select(.Name | endswith($db + "/rw-user")))) as $db_user
  | (first($params[] | select(.Name | endswith($db + "/rw-password")))) as $db_pass
  | { ($db): {host: $db_host.Value, port: $db_port.Value, rwuser: $db_user.Value, rwpass: $db_pass.Value}}));
