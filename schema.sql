PGDMP     3    9    	        	    z            infinity #   14.5 (Ubuntu 14.5-0ubuntu0.22.04.1) #   14.5 (Ubuntu 14.5-0ubuntu0.22.04.1) >    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    220262    infinity    DATABASE     Y   CREATE DATABASE infinity WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';
    DROP DATABASE infinity;
                root    false            ?           0    0    DATABASE infinity    ACL     *   GRANT ALL ON DATABASE infinity TO catnip;
                   root    false    3536            ?           0    0    SCHEMA public    ACL     N   GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   root    false    6                        3079    457860 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            ?           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    459034    action_logs    TABLE        CREATE TABLE public.action_logs (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    bot_id text NOT NULL,
    staff_id text NOT NULL,
    action_reason text DEFAULT 'No reason'::text NOT NULL,
    ts timestamp with time zone DEFAULT now() NOT NULL,
    event text NOT NULL
);
    DROP TABLE public.action_logs;
       public         heap    root    false    2            ?            1259    458690    announcements    TABLE     ?  CREATE TABLE public.announcements (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id text NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    modified_date timestamp with time zone DEFAULT now() NOT NULL,
    expires_date timestamp with time zone DEFAULT now(),
    status text DEFAULT 'active'::text NOT NULL,
    targetted boolean DEFAULT false NOT NULL,
    target text[]
);
 !   DROP TABLE public.announcements;
       public         heap    root    false    2    2            ?            1259    459068    apps    TABLE     ?  CREATE TABLE public.apps (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id text NOT NULL,
    "position" text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    answers jsonb DEFAULT '{}'::jsonb NOT NULL,
    state text DEFAULT 'pending'::text NOT NULL,
    likes bigint[] DEFAULT '{}'::bigint[] NOT NULL,
    dislikes bigint[] DEFAULT '{}'::bigint[] NOT NULL,
    app_id text NOT NULL
);
    DROP TABLE public.apps;
       public         heap    root    false    2            ?            1259    457912    bots    TABLE       CREATE TABLE public.bots (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    bot_id text NOT NULL,
    name text NOT NULL,
    avatar text NOT NULL,
    tags text[] NOT NULL,
    prefix text NOT NULL,
    owner text NOT NULL,
    additional_owners text[] NOT NULL,
    staff_bot boolean DEFAULT false NOT NULL,
    short text NOT NULL,
    long text NOT NULL,
    library text,
    website text,
    donate text,
    support text,
    nsfw boolean DEFAULT false NOT NULL,
    premium boolean DEFAULT false NOT NULL,
    certified boolean DEFAULT false NOT NULL,
    pending_cert boolean DEFAULT false NOT NULL,
    servers integer DEFAULT 0 NOT NULL,
    shards integer DEFAULT 0 NOT NULL,
    users integer DEFAULT 0 NOT NULL,
    shard_list integer[] DEFAULT '{}'::integer[] NOT NULL,
    votes integer DEFAULT 0 NOT NULL,
    clicks integer DEFAULT 0 NOT NULL,
    invite_clicks integer DEFAULT 0 NOT NULL,
    github text,
    banner text,
    invite text NOT NULL,
    type text NOT NULL,
    vanity text,
    external_source text,
    list_source uuid,
    vote_banned boolean DEFAULT false NOT NULL,
    cross_add boolean DEFAULT true,
    start_premium_period bigint DEFAULT 0,
    premium_period_length bigint DEFAULT 0,
    cert_reason text,
    announce boolean DEFAULT false,
    announce_message text,
    uptime bigint DEFAULT 0,
    total_uptime bigint DEFAULT 0,
    claimed boolean DEFAULT false,
    claimed_by text,
    approval_note text DEFAULT 'No note'::text,
    date timestamp with time zone DEFAULT now() NOT NULL,
    webhook text,
    web_auth text,
    custom_webhook text,
    hmac boolean DEFAULT false,
    unique_clicks text[] DEFAULT '{}'::text[] NOT NULL,
    token text DEFAULT public.uuid_generate_v4(),
    last_claimed timestamp with time zone
);
    DROP TABLE public.bots;
       public         heap    root    false    2    2            ?            1259    459021    notifications    TABLE     ?   CREATE TABLE public.notifications (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id text NOT NULL,
    url text NOT NULL,
    message text NOT NULL,
    type text NOT NULL
);
 !   DROP TABLE public.notifications;
       public         heap    root    false    2            ?            1259    457871    oauths    TABLE     ?   CREATE TABLE public.oauths (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    id text NOT NULL,
    token text NOT NULL
);
    DROP TABLE public.oauths;
       public         heap    root    false    2            ?            1259    459054    onboard_data    TABLE     ?   CREATE TABLE public.onboard_data (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id text NOT NULL,
    onboard_code text NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL
);
     DROP TABLE public.onboard_data;
       public         heap    root    false    2            ?            1259    458768    packs    TABLE     Z  CREATE TABLE public.packs (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    owner text NOT NULL,
    name text DEFAULT 'My pack'::text NOT NULL,
    short text NOT NULL,
    votes bigint NOT NULL,
    tags text[] NOT NULL,
    url text NOT NULL,
    date timestamp with time zone DEFAULT now() NOT NULL,
    bots text[] NOT NULL
);
    DROP TABLE public.packs;
       public         heap    root    false    2            ?            1259    458986    poppypaw    TABLE     B  CREATE TABLE public.poppypaw (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    id text NOT NULL,
    notif_id text NOT NULL,
    auth text NOT NULL,
    p256dh text NOT NULL,
    endpoint text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    ua text DEFAULT ''::text NOT NULL
);
    DROP TABLE public.poppypaw;
       public         heap    root    false    2            ?            1259    458673    reports    TABLE     2  CREATE TABLE public.reports (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    bot_id text NOT NULL,
    claimed_by text NOT NULL,
    claimed boolean NOT NULL,
    claimed_at timestamp with time zone DEFAULT now() NOT NULL,
    unclaimed_at timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.reports;
       public         heap    root    false    2            ?            1259    458783    reviews    TABLE       CREATE TABLE public.reviews (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    bot_id text NOT NULL,
    author text NOT NULL,
    content text DEFAULT 'Very good bot!'::text NOT NULL,
    rate boolean DEFAULT true NOT NULL,
    stars integer DEFAULT 1 NOT NULL,
    likes jsonb NOT NULL,
    dislikes jsonb NOT NULL,
    date timestamp with time zone DEFAULT now() NOT NULL,
    replies jsonb DEFAULT '{}'::jsonb NOT NULL,
    editted boolean DEFAULT false NOT NULL,
    flagged boolean DEFAULT false NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    root    false    2            ?            1259    459001 
   silverpelt    TABLE       CREATE TABLE public.silverpelt (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id text NOT NULL,
    bot_id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    last_acked timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.silverpelt;
       public         heap    root    false    2            ?            1259    458808    tickets    TABLE     ?  CREATE TABLE public.tickets (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    channel_id text NOT NULL,
    topic text DEFAULT 'Support'::text NOT NULL,
    user_id text NOT NULL,
    id integer NOT NULL,
    log_url text,
    close_user_id text,
    open boolean DEFAULT true NOT NULL,
    date timestamp with time zone DEFAULT now() NOT NULL,
    panel_message_id text,
    panel_channel_id text
);
    DROP TABLE public.tickets;
       public         heap    root    false    2            ?            1259    458821    transcripts    TABLE       CREATE TABLE public.transcripts (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    id integer NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    closed_by jsonb DEFAULT '{}'::jsonb NOT NULL,
    opened_by jsonb DEFAULT '{}'::jsonb NOT NULL
);
    DROP TABLE public.transcripts;
       public         heap    root    false    2            ?            1259    457879    users    TABLE     ?  CREATE TABLE public.users (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id text NOT NULL,
    username text DEFAULT USER NOT NULL,
    votes jsonb DEFAULT '{}'::jsonb NOT NULL,
    pack_votes jsonb DEFAULT '{}'::jsonb NOT NULL,
    staff_onboarded boolean DEFAULT false NOT NULL,
    staff_onboard_state text DEFAULT 'pending'::text NOT NULL,
    staff_onboard_last_start_time timestamp with time zone,
    staff_onboard_macro_time timestamp with time zone,
    staff_onboard_session_code text,
    staff boolean DEFAULT false NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    hadmin boolean DEFAULT false NOT NULL,
    certified boolean DEFAULT false NOT NULL,
    ibldev boolean DEFAULT false NOT NULL,
    iblhdev boolean DEFAULT false NOT NULL,
    developer boolean DEFAULT false NOT NULL,
    notifications boolean DEFAULT false NOT NULL,
    website text,
    github text,
    nickname text,
    api_token text NOT NULL,
    about text DEFAULT 'I am a very mysterious person'::text,
    vote_banned boolean DEFAULT false,
    staff_stats jsonb DEFAULT '{}'::jsonb NOT NULL,
    new_staff_stats jsonb DEFAULT '{}'::jsonb NOT NULL
);
    DROP TABLE public.users;
       public         heap    root    false    2            ?            1259    458714    votes    TABLE     ?   CREATE TABLE public.votes (
    itag uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id text NOT NULL,
    bot_id text NOT NULL,
    date timestamp with time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.votes;
       public         heap    root    false    2            *           2606    459039    action_logs action_logs_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.action_logs
    ADD CONSTRAINT action_logs_pkey PRIMARY KEY (itag);
 F   ALTER TABLE ONLY public.action_logs DROP CONSTRAINT action_logs_pkey;
       public            root    false    223                       2606    458695     announcements announcements_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (itag);
 J   ALTER TABLE ONLY public.announcements DROP CONSTRAINT announcements_pkey;
       public            root    false    214            .           2606    459073    apps apps_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.apps
    ADD CONSTRAINT apps_pkey PRIMARY KEY (itag);
 8   ALTER TABLE ONLY public.apps DROP CONSTRAINT apps_pkey;
       public            root    false    225                       2606    457919    bots bots_bot_id_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.bots
    ADD CONSTRAINT bots_bot_id_key UNIQUE (bot_id);
 >   ALTER TABLE ONLY public.bots DROP CONSTRAINT bots_bot_id_key;
       public            root    false    212                       2606    457917    bots bots_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.bots
    ADD CONSTRAINT bots_pkey PRIMARY KEY (itag);
 8   ALTER TABLE ONLY public.bots DROP CONSTRAINT bots_pkey;
       public            root    false    212                       2606    458680    reports claims_bot_id_key 
   CONSTRAINT     V   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT claims_bot_id_key UNIQUE (bot_id);
 C   ALTER TABLE ONLY public.reports DROP CONSTRAINT claims_bot_id_key;
       public            root    false    213                       2606    458678    reports claims_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT claims_pkey PRIMARY KEY (itag);
 =   ALTER TABLE ONLY public.reports DROP CONSTRAINT claims_pkey;
       public            root    false    213            (           2606    459026     notifications notifications_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (itag);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            root    false    222                       2606    457876    oauths oauths_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.oauths
    ADD CONSTRAINT oauths_pkey PRIMARY KEY (itag);
 <   ALTER TABLE ONLY public.oauths DROP CONSTRAINT oauths_pkey;
       public            root    false    210            ,           2606    459059    onboard_data onboard_data_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.onboard_data
    ADD CONSTRAINT onboard_data_pkey PRIMARY KEY (itag);
 H   ALTER TABLE ONLY public.onboard_data DROP CONSTRAINT onboard_data_pkey;
       public            root    false    224                       2606    458773    packs packages_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.packs
    ADD CONSTRAINT packages_pkey PRIMARY KEY (itag);
 =   ALTER TABLE ONLY public.packs DROP CONSTRAINT packages_pkey;
       public            root    false    216            $           2606    458991    poppypaw poppypaw_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.poppypaw
    ADD CONSTRAINT poppypaw_pkey PRIMARY KEY (itag);
 @   ALTER TABLE ONLY public.poppypaw DROP CONSTRAINT poppypaw_pkey;
       public            root    false    220                       2606    458788    reviews reviews_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (itag);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            root    false    217            &           2606    459006    silverpelt silverpelt_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.silverpelt
    ADD CONSTRAINT silverpelt_pkey PRIMARY KEY (itag);
 D   ALTER TABLE ONLY public.silverpelt DROP CONSTRAINT silverpelt_pkey;
       public            root    false    221                       2606    458818    tickets tickets_id_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_id_key UNIQUE (id);
 @   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_id_key;
       public            root    false    218                        2606    458813    tickets tickets_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (itag);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            root    false    218            "           2606    458826    transcripts transcripts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.transcripts
    ADD CONSTRAINT transcripts_pkey PRIMARY KEY (itag);
 F   ALTER TABLE ONLY public.transcripts DROP CONSTRAINT transcripts_pkey;
       public            root    false    219            	           2606    457884    users users_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (itag);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            root    false    211                       2606    457886    users users_user_id_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_id_key UNIQUE (user_id);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_id_key;
       public            root    false    211                       2606    458719    votes votes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (itag);
 :   ALTER TABLE ONLY public.votes DROP CONSTRAINT votes_pkey;
       public            root    false    215                       1259    457959    bots_migindex    INDEX     ]   CREATE INDEX bots_migindex ON public.bots USING btree (bot_id, staff_bot, cross_add, token);
 !   DROP INDEX public.bots_migindex;
       public            root    false    212    212    212    212            6           2606    458796    reviews author_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT author_fkey FOREIGN KEY (author) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.reviews DROP CONSTRAINT author_fkey;
       public          root    false    217    3339    211            0           2606    458683    reports bot_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reports
    ADD CONSTRAINT bot_id_fkey FOREIGN KEY (bot_id) REFERENCES public.bots(bot_id) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.reports DROP CONSTRAINT bot_id_fkey;
       public          root    false    3341    212    213            3           2606    458727    votes bot_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.votes
    ADD CONSTRAINT bot_id_fkey FOREIGN KEY (bot_id) REFERENCES public.bots(bot_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.votes DROP CONSTRAINT bot_id_fkey;
       public          root    false    212    215    3341            5           2606    458791    reviews bot_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT bot_id_fkey FOREIGN KEY (bot_id) REFERENCES public.bots(bot_id) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.reviews DROP CONSTRAINT bot_id_fkey;
       public          root    false    212    3341    217            :           2606    459014    silverpelt bot_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.silverpelt
    ADD CONSTRAINT bot_id_fkey FOREIGN KEY (bot_id) REFERENCES public.bots(bot_id) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.silverpelt DROP CONSTRAINT bot_id_fkey;
       public          root    false    3341    212    221            <           2606    459042    action_logs bot_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.action_logs
    ADD CONSTRAINT bot_id_fkey FOREIGN KEY (bot_id) REFERENCES public.bots(bot_id) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.action_logs DROP CONSTRAINT bot_id_fkey;
       public          root    false    212    223    3341            7           2606    458827    transcripts id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.transcripts
    ADD CONSTRAINT id_fkey FOREIGN KEY (id) REFERENCES public.tickets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.transcripts DROP CONSTRAINT id_fkey;
       public          root    false    3358    219    218            8           2606    458994    poppypaw id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.poppypaw
    ADD CONSTRAINT id_fkey FOREIGN KEY (id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.poppypaw DROP CONSTRAINT id_fkey;
       public          root    false    211    3339    220            /           2606    457922    bots owner_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.bots
    ADD CONSTRAINT owner_fkey FOREIGN KEY (owner) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.bots DROP CONSTRAINT owner_fkey;
       public          root    false    3339    212    211            4           2606    458776    packs owner_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.packs
    ADD CONSTRAINT owner_fkey FOREIGN KEY (owner) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.packs DROP CONSTRAINT owner_fkey;
       public          root    false    211    216    3339            =           2606    459047    action_logs staff_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.action_logs
    ADD CONSTRAINT staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.action_logs DROP CONSTRAINT staff_id_fkey;
       public          root    false    3339    211    223            1           2606    458698    announcements user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.announcements DROP CONSTRAINT user_id_fkey;
       public          root    false    214    3339    211            2           2606    458722    votes user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.votes
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.votes DROP CONSTRAINT user_id_fkey;
       public          root    false    215    211    3339            9           2606    459009    silverpelt user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.silverpelt
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.silverpelt DROP CONSTRAINT user_id_fkey;
       public          root    false    211    221    3339            ;           2606    459029    notifications user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.notifications DROP CONSTRAINT user_id_fkey;
       public          root    false    222    211    3339            >           2606    459062    onboard_data user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.onboard_data
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.onboard_data DROP CONSTRAINT user_id_fkey;
       public          root    false    211    3339    224            ?           2606    459076    apps user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.apps
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.apps DROP CONSTRAINT user_id_fkey;
       public          root    false    211    3339    225           