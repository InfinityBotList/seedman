VERSION = 11 # Auto-updated on 2022-10-26 09:57:54.059248

import datetime
import secrets
import uuid
import asyncpg
import os
import dotenv
import asyncio
from fastapi.encoders import jsonable_encoder
import json

from typing import Any

os.environ["PGDATABASE"] = "infinity"

print("Creating pg_dump")

os.system("rm -rf schema.sql seed_data.json")

code = os.system(f"pg_dump --verbose -Fc --schema-only --no-owner -d infinity > schema.sql")

print("Exited with code", code)

class SeedSource():
    def __init__(self, table: str, column: str, value: Any):
        self.table = table
        self.column = column
        self.value = value

class TODO():
    def __init__(self, table: str):
        self.table = table

async def main():
    BOT_ID = "786227592160215051"

    SEED_PARENT = [
        SeedSource(table="users", column="user_id", value="563808552288780322"), # Rootsprings user info
        SeedSource(table="users", column="user_id", value="510065483693817867"), # Toxic devs user info
        SeedSource(table="bots", column="bot_id", value="721279531939397673"), # Bristlefrost bot
        SeedSource(table="bots", column="bot_id", value="815553000470478850"), # For reviews, IBL bot
        SeedSource(table="reviews", column="bot_id", value="815553000470478850"), # IBL bot reviews
        SeedSource(table="tickets", column="id", value=67021157), # IBL tickets (toxics test tickets)
        SeedSource(table="transcripts", column="id", value=67021157), # IBL transcript (toxics test transcript)
        SeedSource(table="votes", column="bot_id", value="721279531939397673"), # Bristlefrosts votes

        # Cant be seeded as theres no data to seed from
        TODO("packs"), 
        TODO("notify")
    ]

    conn = await asyncpg.connect() 

    seed_data = []

    for seed in SEED_PARENT:
        if isinstance(seed, TODO):
            continue
        # Fetch the seed data
        seed_data.append({
            "table": seed.table,
            "data": jsonable_encoder(await conn.fetch(f"SELECT * FROM {seed.table} WHERE {seed.column} = $1", seed.value))
        })

    cleaned_seed = []

    # Strip out api tokens from the data
    for seed in seed_data:
        seed_inf = {"table": seed["table"], "data": []}
        for row in seed["data"]:
            row_inf = {}
            for key, value in row.items():
                if key == "webhook":
                    row_inf[key] = "https://testhook.xyz"
                elif "token" in key or "webAuth" in key or "web" in key:
                    row_inf[key] = str(uuid.uuid4())
                elif "unique_click" in key:
                    row_inf[key] = []
                else:
                    row_inf[key] = value
            seed_inf["data"].append(row_inf)
        cleaned_seed.append(seed_inf)

    # Write the seed data to a file
    with open("seed_data.json", "w") as f:
        json.dump(cleaned_seed, f)

    # Save seed versioning info in a file as well
    with open("seed_meta.json", "w") as f:
        json.dump({
            "nonce": secrets.token_urlsafe(16),
            "version": VERSION,
            "created_at": datetime.datetime.now().isoformat()
        }, f)

    # update this file to increment version
    with open("create_seed_files.py") as f:
        lines = f.readlines()
    
    lines[0] = f"VERSION = {VERSION + 1} # Auto-updated on {datetime.datetime.now()}\n"

    with open("create_seed_files.py", "w") as f:
        f.writelines(lines)

asyncio.run(main())
