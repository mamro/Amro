<?xml version="1.0" encoding="UTF-8" standalone="no"?><map version="0.8.1"><node CREATED="1384161489110" ID="7948u9uh5n2pp6jvqkoper8hr2" MODIFIED="1384161489111" TEXT="Data Mapping and Transformations"><node CREATED="1384161489111" ID="6v793o8tndohh0o2ff9hsp8k2j" MODIFIED="1384161489111" POSITION="right" TEXT="Data Selection "><font BOLD="true" NAME="SansSerif" SIZE="12"/><node CREATED="1384161489111" ID="1eg6gh61jvc93nnmt8esjshn8a" MODIFIED="1384161489111" TEXT="WHERE Clause"><node COLOR="#008000" CREATED="1384161489111" ID="3ne7u4a8qvtvgfdm7m3qp0j91d" MODIFIED="1384161489111" TEXT="MAP sales.tcustord, TARGET sales.tord,&#13;&#10;WHERE (PRODUCT_AMOUNT &gt; 10000);&#13;&#10;MAP sales.tcustord, TARGET sales.tord,&#13;&#10;WHERE (PRODUCT_TYPE = “AUTO”);"/><node CREATED="1384161489111" ID="6k080nck4o07nu7s60m1ukqh1d" MODIFIED="1384161489112" TEXT="Arithmetic operators and floating-point data types are not supported by WHERE"/><node CREATED="1384161489112" ID="7jv0icaavqakedlaipkpf0lf6u" MODIFIED="1384161489112" TEXT="on either the MAP or TABLE parameter "/></node><node CREATED="1384161489112" ID="66bohajbmcdg0q366mdbs1tled" MODIFIED="1384161489112" TEXT="FILTER Clause"><node CREATED="1384161489112" ID="2rrf9btndgc8tv51e2af9r16o5" MODIFIED="1384161489112" TEXT="on either the MAP or TABLE parameter "/><node CREATED="1384161489112" ID="07cmbjlvt8imsgc0viu9cvaspr" MODIFIED="1384161489112" TEXT="complex operation than where"/><node CREATED="1384161489112" ID="7ge649jkj2ajgapqlcgdgme35t" MODIFIED="1384161489112" TEXT="example"><node CREATED="1384161489112" ID="2pf2m7df99rgma4kkcedcarvl2" MODIFIED="1384161489112" TEXT="FILTER ((PRODUCT_PRICE*PRODUCT_AMOUNT)&gt;10000);"/><node CREATED="1384161489112" ID="3gnhv0ut4ncb8brdgigv5r1l7t" MODIFIED="1384161489112" TEXT="FILTER (@STRFIND(NAME, &quot;JOE&quot;)&gt;0);"/></node></node><node CREATED="1384161489112" ID="64m0670s0mp5lrt99peg8u6tr4" MODIFIED="1384161489112" TEXT="RANGE"><node CREATED="1384161489112" ID="0opsqq8k6qortbjan7al29rn66" MODIFIED="1384161489112" TEXT="Divides workload into multiple, randomly distributed groups of data"/><node CREATED="1384161489112" ID="72pbknklj0odi9a0rc3r2t99cg" MODIFIED="1384161489112" TEXT="Syntax "><node CREATED="1384161489112" ID="0ktutg7houpglgjdtjuo8j7usg" MODIFIED="1384161489112" TEXT="@RANGE (&lt;my range&gt;, &lt;total ranges&gt;      [, &lt;column&gt; [, ...]])&#13;&#10;"/></node><node CREATED="1384161489112" ID="3pb1h1392gvkvb7g38p2u401cj" MODIFIED="1384161489112" TEXT="example"><node CREATED="1384161489112" ID="1ifepld400j7gb2u9sm5jnv4ab" MODIFIED="1384161489112" TEXT="Replicat #1"><node CREATED="1384161489112" ID="6sj8o8bhjkjjqj73tkdpi8r955" MODIFIED="1384161489112" TEXT="MAP SALES.ACCOUNT,TARGET SALES.ACCOUNT, FILTER (@RANGE (1,3));"/></node><node CREATED="1384161489112" ID="7b04nfvojf9691neti9as3vqn1" MODIFIED="1384161489112" TEXT="Replicat #2"><node CREATED="1384161489112" ID="5p140q0pcrfkr194d12ptfvfds" MODIFIED="1384161489112" TEXT="MAP SALES.ACCOUNT, TARGET SALES.ACCOUNT, FILTER (@RANGE (2,3));"/></node><node CREATED="1384161489112" ID="3mpcctgh2eeegf3urajfhkvuuc" MODIFIED="1384161489112" TEXT="Replicat #3"><node CREATED="1384161489112" ID="66kaeumssap3b92vd1poj3pvb5" MODIFIED="1384161489112" TEXT="MAP SALES.ACCOUNT, TARGET SALES.ACCOUNT, FILTER (@RANGE (3,3)); "/></node></node></node></node><node CREATED="1384161489112" ID="4nj997ciu1h9fqpataij5hsco4" MODIFIED="1384161489112" POSITION="right" TEXT="Column Mapping&#13;&#10;"><node CREATED="1384161489112" ID="6r2kigf6mt48hqmrvrk059ph6a" MODIFIED="1384161489112" TEXT="COLMAP "><node CREATED="1384161489112" ID="77mvlhq1ngh9ak2b14unco8fdh" MODIFIED="1384161489113" TEXT="MAP HR.CONTACT, TARGET HR.PHONE,&#13;&#10;COLMAP (USEDEFAULTS,&#13;&#10;NAME = CUST_NAME,&#13;&#10;PHONE_NUMBER = @STRCAT( “(”, AREA_CODE, “)”, &#13;&#10;PH_PREFIX, “-”, PH_NUMBER ) ); &#13;&#10;"/></node><node CREATED="1384161489113" ID="5idr89r6lis0vpclrb4gtod5ki" MODIFIED="1384161489113" TEXT="Building History"><node CREATED="1384161489113" ID="2v0tgkhnn9gnrn9ccbgkuc3089" MODIFIED="1384161489113" TEXT="INSERTALLRECORDS "><node CREATED="1384161489113" ID="6g2euk5acpq5s2nbg0mchvtiva" MODIFIED="1384161489113" TEXT="INSERTALLRECORDS causes Replicat to insert every change operation made to a record as a new record in the database. The initial insert and subsequent updates and deletes are maintained as point-in-time snapshots.&#13;&#10;"/><node CREATED="1384161489113" ID="5l87cvf3i8917f76v57ecip9d7" MODIFIED="1384161489113" TEXT="INSERTALLRECORDS&#13;&#10;MAP SALES.ACCOUNT, TARGET REPORT.ACCTHISTORY,&#13;&#10;&#9;COLMAP (USEDEFAULTS,&#13;&#10;&#9;TRAN_TIME = &#9;&#9;@GETENV(“GGHEADER”,”COMMITTIMESTAMP”),&#13;&#10;&#9;OP_TYPE = @GETENV(“GGHEADER”, “OPTYPE”),&#13;&#10;&#9;BEFORE_AFTER_IND = &#13;&#10;&#9;@GETENV(“GGHEADER”,“BEFOREAFTERINDICATOR”));"/></node></node></node><node CREATED="1384161489113" ID="2rb9l3h4rj4noo221inasadr7j" MODIFIED="1384161489113" POSITION="right" TEXT="Functions"><node CREATED="1384161489113" ID="6e2sn46sj6mp1jt1ag07q9geva" MODIFIED="1384161489113" TEXT="Data Transformation"><node CREATED="1384161489113" ID="61p546ve762qqfeb51qm8fkgjo" MODIFIED="1384161489113" TEXT="Example"><node CREATED="1384161489113" ID="6k30ttkqlu3ju3ki11neba972e" MODIFIED="1384161489113" TEXT="MAP SALES.ACCOUNT, TARGET REPORT.ACCOUNT,&#13;&#10;COLMAP ( USEDEFAULTS,&#13;&#10;&#9;&#9;TRANSACTION_DATE = @DATE (“YYYY-MM-DD”,&#13;&#10;&#9;&#9;&#9;&#9;&#9;&#9;“YY”, YEAR,&#13;&#10;&#9;&#9;&#9;&#9;&#9;&#9;“MM”, MONTH,&#13;&#10;&#9;&#9;&#9;&#9;&#9;&#9;“DD”, DAY),&#13;&#10;&#9;&#9;AREA_CODE    = @STREXT (PHONE-NO, 1, 3),&#13;&#10;&#9;&#9;PHONE_PREFIX = @STREXT (PHONE-NO, 4, 6),&#13;&#10;&#9;&#9;PHONE_NUMBER = @STREXT (PHONE-NO, 7, 10) ); &#13;&#10;"/></node></node><node CREATED="1384161489113" ID="0uevg0q39inbo2e03uhjn92uso" MODIFIED="1384161489113" TEXT="@STREXT "><node CREATED="1384161489113" ID="45rloepeg8l0g1rtobsur25omk" MODIFIED="1384161489113" TEXT="extract portions of a string field "/><node CREATED="1384161489113" ID="692c050beusjo7ra1a35955608" MODIFIED="1384161489113" TEXT="AREA_CODE    = @STREXT (PHONE-NO, 1, 3),"/></node><node CREATED="1384161489113" ID="2c1ebr5qpr6e7jg3iol0q082ei" MODIFIED="1384161489113" TEXT="GETENV"><node CREATED="1384161489113" ID="5ud2vvf04pfgdt0qs6n8runqgs" MODIFIED="1384161489113" TEXT="Returns information on the GoldenGate environment"/></node><node CREATED="1384161489113" ID="1ih2civkv5cqqqpgr9la45f8j0" MODIFIED="1384161489113" TEXT="TOKEN"><node CREATED="1384161489113" ID="41p097s5gjd01efb4vft6cjtmk" MODIFIED="1384161489113" TEXT="Maps environmental values that are stored in the user token area to the target column"/></node><node CREATED="1384161489113" ID="5rvilo8gouaf4qjon4d168jskb" MODIFIED="1384161489113" TEXT="GETVAL"><node CREATED="1384161489113" ID="1c45rs93k7coe750pfdhqngln6" MODIFIED="1384161489113" TEXT="Extracts parameters from a stored procedure as input to a FILTER or COLMAP clause."/></node></node><node CREATED="1384161489113" ID="0qvvq4smaqrah9rs5fel30h33j" MODIFIED="1384161489113" POSITION="right" TEXT="SQLEXEC"><node CREATED="1384161489113" ID="0mkak5jteeies8sgh5vh7p62hh" MODIFIED="1384161489113" TEXT="enabling Extract and Replicat to communicate with the application database through SQL queries or run stored procedures"/><node CREATED="1384161489113" ID="0omeovtau9oujm5c9nr9angsum" MODIFIED="1384161489113" TEXT="example"><node CREATED="1384161489113" ID="5gbdc7cs0l5nm0j8n3giujjo14" MODIFIED="1384161489113" TEXT="Using with Lookup Stored Procedure"><node CREATED="1384161489113" ID="4qlj2ovclhge1lkuvsr7pe30m4" MODIFIED="1384161489113" TEXT="CREATE OR REPLACE PROCEDURE LOOKUP&#13;&#10;&#9;(CODE_PARAM IN VARCHAR2, DESC_PARAM OUT VARCHAR2)&#13;&#10;BEGIN&#13;&#10;&#9;SELECT DESC_COL INTO DESC_PARAM&#13;&#10;&#9;FROM LOOKUP_TABLE&#13;&#10;&#9;WHERE CODE_COL = CODE_PARAM;&#13;&#10;END; &#13;&#10;"/><node CREATED="1384161489113" ID="54j3p0abnksfodkokml2no3vvo" MODIFIED="1384161489113" TEXT="Replicat parameter file"><node CREATED="1384161489113" ID="6tsc6jnum2ggfn20i28ac1nl3l" MODIFIED="1384161489113" TEXT="MAP HR.ACCOUNT, TARGET HR.NEWACCT,&#13;&#10;&#9;SQLEXEC (spname lookup, &#13;&#10;           params (code_param = account_code)),&#13;&#10;&#9;COLMAP  (USEDEFAULTS, newacct_id = account_id,&#13;&#10;&#9;&#9;       newacct_val = @GETVAL(lookup.desc_param)); &#13;&#10;"/></node></node><node CREATED="1384161489114" ID="1hlge1n3nmkn5dn2ir38rcst2m" MODIFIED="1384161489114" TEXT="SQLEXEC – Using with SQL Query"><node CREATED="1384161489114" ID="4fvoeqj3sj0a8qglooopgcub8f" MODIFIED="1384161489114" TEXT="SQLEXEC (id lookup,&#13;&#10;     query “select desc_param from lookup_table &#13;&#10;&#9;&#9;&#9;where code_col = :code_param”,&#13;&#10;&#9;&#9;&#9;params (code_param = account_code)),&#13;&#10;&#9;COLMAP (USEDEFAULTS, newacct_id = account_id,&#13;&#10;&#9;&#9;newacct_val = @GETVAL(lookup.desc_param)); &#13;&#10;"/></node></node></node><node CREATED="1384161489114" ID="0k7tuutb5urbavo1ib27386j4i" MODIFIED="1384161489114" POSITION="left" TEXT="Macros"><node CREATED="1384161489114" ID="3909prgvrfej0g4c4vfed5fai5" MODIFIED="1384161489114" TEXT="Macros can be defined in the parameter file or included in a macro file"/><node CREATED="1384161489114" ID="6066abf36nk3gcj4ugrf33hl1t" MODIFIED="1384161489114" TEXT="Macros enable easier and more efficient building of parameters:&#13;&#10;"/><node CREATED="1384161489114" ID="3skiajod4oulkvu9eskuese0ss" MODIFIED="1384161489114" TEXT="macros work with the following parameter files"><node CREATED="1384161489114" ID="6bv6s7msg3jb47sab54b57hbj9" MODIFIED="1384161489114" TEXT="Manager"/><node CREATED="1384161489114" ID="7dujfbgqvpelcgd621jq435upt" MODIFIED="1384161489114" TEXT="extract"/><node CREATED="1384161489114" ID="4m5amc41l80e5va45tr2il5psn" MODIFIED="1384161489114" TEXT="replicate"/></node><node CREATED="1384161489114" ID="7g3u341f19l94mqkv26dnfbcj9" MODIFIED="1384161489114" TEXT="examples"><node CREATED="1384161489114" ID="4e2pm7svkk74nmmreuqkofjlqg" MODIFIED="1384161489114" TEXT="EXTRACT EXSALES&#13;&#10;MACRO #make_date&#13;&#10;PARAMS (#year, #month, #day)&#13;&#10;BEGIN&#13;&#10; @DATE(“YYYY-MM-DD”, “CC”, @IF(#year &lt; 50, 20, 19), &#13;&#10;       &#9;“YY”, #year, “MM”, #month, “DD”, #day)&#13;&#10;END;&#13;&#10; &#13;&#10;MAP SALES.ACCT, TARGET REPORT.ACCOUNT,&#13;&#10;COLMAP&#13;&#10;(&#9;TARGETCOL1 = SOURCECOL1,&#13;&#10;&#9;Order_Date = #make_date(Order_YR,Order_MO,Order_DAY),&#13;&#10;&#9;Ship_Date  = #make_date(Ship_YR,Ship_MO,Ship_DAY)&#13;&#10; ); &#13;&#10;"/><node CREATED="1384161489114" ID="4r4fue7lkirov1gi3vu3tjarve" MODIFIED="1384161489114" TEXT="Consolidating Multiple Parameters:"><node CREATED="1384161489114" ID="2h0pbegj7bafa5u98uk6kuqig7" MODIFIED="1384161489114" TEXT="Define the macro"><node COLOR="#008000" CREATED="1384161489114" ID="5he6o3i2kqjakbvohr6kfbhuch" MODIFIED="1384161489114" STYLE="bubble" TEXT="MACRO #option_defaults&#13;&#10;BEGIN&#13;&#10;GETINSERTS&#13;&#10;GETUPDATES&#13;&#10;GETDELETES&#13;&#10;INSERTDELETES&#13;&#10;END;"><font NAME="SansSerif" SIZE="10"/></node></node><node CREATED="1384161489115" ID="0ab834lm79do1vhs8djum90ere" MODIFIED="1384161489115" TEXT="Invoke the macro"><node CREATED="1384161489115" ID="3gc7ifu8oeekmre2fodp8fijl0" MODIFIED="1384161489115" TEXT="#option_defaults ()&#13;&#10;IGNOREUPDATES&#13;&#10;MAP SALES.SRCTAB, TARGET SALES.TARGTAB;&#13;&#10;#option_defaults ()&#13;&#10;MAP SALES.SRCTAB2, TARGET SALES.TARGTAB2;"/></node></node></node><node CREATED="1384161489115" ID="19e4l2nu2uu363j75o91378sng" MODIFIED="1384161489115" TEXT="Libraries"><node CREATED="1384161489115" ID="2h7sngode8s67eap88lu5o2b50" MODIFIED="1384161489115" TEXT="Macros can be built in a library and referenced into your parameter file"/><node CREATED="1384161489115" ID="2gedsjebnmf236gn20qkt1q621" MODIFIED="1384161489115" TEXT="EXTRACT EXTACCT&#13;&#10;INCLUDE /ggs/dirprm/macro.lib"/></node><node CREATED="1384161489115" ID="07ovcubaf1uurq6lii9m5pcat8" MODIFIED="1384161489115" TEXT="Expansion"><node CREATED="1384161489115" ID="5kga4b16qnmprc0nea8kki0m8a" MODIFIED="1384161489115" TEXT="enables tracing of macro expansion for debugging purposes "/><node CREATED="1384161489115" ID="21il8fi13nem2od34mkl5tap6g" MODIFIED="1384161489115" TEXT="CMDTRACE [ ON | OFF | DETAIL ]"/><node CREATED="1384161489115" ID="6vvrbc7q067rf05j07tmevmg86" MODIFIED="1384161489115" TEXT="EXTRACT EXTACCT&#13;&#10;INCLUDE /ggs/dirprm/macro.lib&#13;&#10;CMDTRACE ON&#13;&#10;MAP SALES.ACCOUNT, TARGET REPORT.ACCOUNT_HISTORY,&#13;&#10;COLMAP (USEDEFAULTS, #maptranfields () );                &#13;&#10;"/></node></node><node CREATED="1384161489115" ID="01nn5q3hdu61aore8moqum5uqb" MODIFIED="1384161489115" POSITION="left" TEXT="User Tokens"><node CREATED="1384161489115" ID="0clrd131a5dgve3p9orpi28g25" MODIFIED="1384161489115" TEXT="store environmental values in the user token area of the GoldenGate record header"/><node CREATED="1384161489115" ID="41fkbukjh65svuijhovpi84m51" MODIFIED="1384161489115" TEXT="Store token values through a TABLE TOKENS clause and @GETENV functions"><node CREATED="1384161489115" ID="34goen613hrmvacfvvdc5mj6g9" MODIFIED="1384161489115" TEXT="TABLE SALES.PRODUCT, &#11;TOKENS (TKN1 = @GETENV(“GGENVIRONMENT&quot;,“OSUSERNAME&quot;), &#11;TKN2 = @GETENV(“GGHEADER&quot;,“COMMITTIMESTAMP&quot;) );&#13;&#10;"/></node><node CREATED="1384161489115" ID="6h0fi49kpo5f71e8b74nevtbkb" MODIFIED="1384161489115" TEXT="Use token values to populate target columns through a MAP COLMAP clause and @TOKEN functions"><node CREATED="1384161489115" ID="36nnl4gp58rc0rsth8q78siimf" MODIFIED="1384161489115" TEXT="MAP SALES.PRODUCT, TARGET SALES.PRODUCT_HISTORY,&#11;COLMAP (USEDEFAULTS, OSUSER = @TOKEN(“TKN1&quot;), &#11;TRANSTIME = @TOKEN(“TKN2&quot;) ); &#13;&#10;"/></node><node CREATED="1384161489115" ID="707bp8ib6b5qt71ie38nqp4uh5" MODIFIED="1384161489115" TEXT="Environmental Values Available "><node CREATED="1384161489115" ID="6ebpp9m4p49tqia8ti5qppfu3c" MODIFIED="1384161489115" TEXT="Setting"><node CREATED="1384161489115" ID="46f39rslkals9gtt00qtb0njfc" MODIFIED="1384161489115" TEXT="EXTRACT EXTDEMO&#11;TABLE SALES.PRODUCT, TOKENS (TKN-OSUSER&#9;&#9;= @GETENV (“GGENVIRONMENT&quot;,“OSUSERNAME&quot;), TKN-DOMAIN&#9;&#9;= @GETENV (“GGENVIRONMENT&quot;,“DOMAINNAME&quot;), TKN-COMMIT-TS &#9;= @GETENV (“GGHEADER&quot;, “COMMITTIMESTAMP&quot;), TKN-BA-IND &#9;&#9;= @GETENV(“GGHEADER&quot;,“BEFOREAFTERINDICATOR), &#11;TKN-TABLE&#9;&#9;= @GETENV (“GGHEADER&quot;, “TABLENAME&quot;), TKN-OP-TYPE &#9;= @GETENV (“GGHEADER&quot;, “OPTYPE&quot;), &#11;TKN-LENGTH&#9;&#9;= @GETENV (“GGHEADER&quot;, “RECORDLENGTH&quot;), &#11;TKN-DB-VER&#9;&#9;= @GETENV (“DBENVIRONMENT&quot;, “DBVERSION&quot;)&#11;); &#13;&#10;"/></node><node CREATED="1384161489115" ID="2t0790nbbgdslerd0u4f5qpdg7" MODIFIED="1384161489115" TEXT="Using"><node COLOR="#008000" CREATED="1384161489115" ID="2bu6akuamrv64vg0l4rq89tamu" MODIFIED="1384161489115" STYLE="bubble" TEXT="MAP SALES.ORDER, TARGET REPORT.ORDER_HISTORY,&#13;&#10;COLMAP (USEDEFAULTS,&#13;&#10;TKN_NUMRECS  = @TOKEN (&quot;TKN-NUMRECS&quot;);&#13;&#10;&#13;&#10;MAP SALES.CUSTOMER, TARGET REPORT.CUSTOMER_HISTORY, &#13;&#10;COLMAP (USEDEFAULTS,&#13;&#10;TRAN_TIME &#9;     = @TOKEN (&quot;TKN-COMMIT-TS&quot;),&#13;&#10;OP_TYPE&#9;&#9;     = @TOKEN (“TKN-OP-TYPE”), &#13;&#10;BEFORE_AFTER_IND = @TOKEN (“TKN-BA-IND”),&#13;&#10;TKN_ROWID &#9;&#9; = @TOKEN (&quot;TKN-ROWID&quot;));"><font NAME="SansSerif" SIZE="12"/></node></node></node></node></node></map>