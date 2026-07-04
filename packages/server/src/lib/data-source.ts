import { DataSource } from "typeorm"

export const AppDataSource = new DataSource({
  type: "postgres",
  host: process.env.PGHOST,
  username: process.env.PGUSER,
  database: process.env.PGDATABASE,
  password: process.env.PGPASSWORD,
  synchronize: false,
  logging: false,
  entities: [__dirname + "/../models/*.ts"],
  migrations: [],
  subscribers: [],
})
