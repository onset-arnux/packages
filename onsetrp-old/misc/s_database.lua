
sql = true

local SQL_HOST = "46.4.121.78"
local SQL_PORT = 3306
local SQL_USER = "u24_W8YExB2H8c"
local SQL_PASS = "7TywtpnA2z9UpBN2hK0XnAcj"
local SQL_DATA = "s24_onset"
local SQL_CHAR = "utf8mb4"
local SQL_LOGL = "debug"

-- Setup a MariaDB connection when the package/server starts
local function OnPackageStart()
	mariadb_log(SQL_LOGL)

	sql = mariadb_connect(SQL_HOST .. ':' .. SQL_PORT, SQL_USER, SQL_PASS, SQL_DATA)

	if (sql ~= false) then
		print("MariaDB: Connected to " .. SQL_HOST)
		mariadb_set_charset(sql, SQL_CHAR)
	else
		print("MariaDB: Connection failed to " .. SQL_HOST .. ", see mariadb_log file")

		-- Immediately stop the server if we cannot connect
		ServerExit()
	end

	CallEvent("database:connected")
end
AddEvent("OnPackageStart", OnPackageStart)

-- Cleanup the MariaDB connection when the package/server stops
local function OnPackageStop()
	mariadb_close(sql)
end
AddEvent("OnPackageStop", OnPackageStop)
