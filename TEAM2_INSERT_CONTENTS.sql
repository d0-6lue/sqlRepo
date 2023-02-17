-- OTT 컨텐츠

CREATE SEQUENCE COTENTS_NO_SEQ
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
;

INSERT INTO CONTENTS
VALUES ( COTENTS_NO_SEQ.NEXTVAL,
        (SELECT DIRECTOR_NO FROM DIRECTOR WHERE DIRECTOR_NAME = '제임스 카메론'),
        (SELECT COUNTRY_NO FROM COUNTRY WHERE COUNTRY_NAME = '미국'),
        (SELECT CATEGORY_NO FROM CATEGORY WHERE CATEGORY_NAME = '영화'),
        '아바타: 물의 길',
        '<아바타: 물의 길>은 판도라 행성에서
        제이크 설리와 네이티리가 이룬 가족이 겪게 되는 무자비한 위협과
        살아남기 위해 떠나야 하는 긴 여정과 전투,
        그리고 견뎌내야 할 상처에 대한 이야기를 그렸다.',
        '2022/12/14'
        ,DEFAULT
        ,DEFAULT
);

INSERT INTO CONTENTS
VALUES ( COTENTS_NO_SEQ.NEXTVAL,
        (SELECT DIRECTOR_NO FROM DIRECTOR WHERE DIRECTOR_NAME = '봉준호'),
        (SELECT COUNTRY_NO FROM COUNTRY WHERE COUNTRY_NAME = '한국'),
        (SELECT CATEGORY_NO FROM CATEGORY WHERE CATEGORY_NAME = '영화'),
        '기생충',
        '“폐 끼치고 싶진 않았어요”
        전원백수로 살 길 막막하지만 사이는 좋은 기택(송강호) 가족.
        장남 기우(최우식)에게 명문대생 친구가 연결시켜 준 고액 과외 자리는
        모처럼 싹튼 고정수입의 희망이다.
        온 가족의 도움과 기대 속에 박사장(이선균) 집으로 향하는 기우.
        글로벌 IT기업 CEO인 박사장의 저택에 도착하자
        젊고 아름다운 사모님 연교(조여정)가 기우를 맞이한다.
 
         그러나 이렇게 시작된 두 가족의 만남 뒤로, 걷잡을 수 없는 사건이 기다리고 있었으니…',
        '2019/05/30'
        ,DEFAULT
        ,DEFAULT
);

INSERT INTO CONTENTS
VALUES ( COTENTS_NO_SEQ.NEXTVAL,
        (SELECT DIRECTOR_NO FROM DIRECTOR WHERE DIRECTOR_NAME = '신카이 마코토'),
        (SELECT COUNTRY_NO FROM COUNTRY WHERE COUNTRY_NAME = '일본'),
        (SELECT CATEGORY_NO FROM CATEGORY WHERE CATEGORY_NAME = '영화'),
        '너의 이름은.',
        '아직 만난 적 없는 너를, 찾고 있어
 
        천년 만에 다가오는 혜성
        기적이 시작된다
 
        도쿄에 사는 소년 ‘타키’와 시골에 사는 소녀 ‘미츠하’는
        서로의 몸이 뒤바뀌는 신기한 꿈을 꾼다
        낯선 가족, 낯선 친구들, 낯선 풍경들...
        반복되는 꿈과 흘러가는 시간 속, 마침내 깨닫는다
        우리, 서로 뒤바뀐 거야?
 
        절대 만날 리 없는 두 사람
        반드시 만나야 하는 운명이 되다
 
        서로에게 남긴 메모를 확인하며
        점점 친구가 되어가는 ‘타키’와 ‘미츠하’
        언제부턴가 더 이상 몸이 바뀌지 않자
        자신들이 특별하게 이어져있었음을 깨달은
        ‘타키’는 ‘미츠하’를 만나러 가는데...',
        '2017/01/04'
        ,DEFAULT
        ,DEFAULT
);

INSERT INTO CONTENTS
VALUES ( COTENTS_NO_SEQ.NEXTVAL,
        (SELECT DIRECTOR_NO FROM DIRECTOR WHERE DIRECTOR_NAME = '라지쿠마르 히라니'),
        (SELECT COUNTRY_NO FROM COUNTRY WHERE COUNTRY_NAME = '인도'),
        (SELECT CATEGORY_NO FROM CATEGORY WHERE CATEGORY_NAME = '영화'),
        '세얼간이',
        '‘알 이즈 웰’을 외치던 유쾌한 세 남자가 돌아왔다!
        천재들만 간다는 일류 명문대 ICE, 성적과 취업만을 강요하는 학교를 발칵 뒤집어 놓은 대단한 녀석 란초!
        아버지가 정해준 꿈, `공학자`가 되기 위해 정작 본인이 좋아하는 일은 포기하고 공부만하는 파파보이 파르한!
        찢어지게 가난한 집, 병든 아버지와 식구들을 책임지기 위해 무조건 대기업에 취직해야만 하는 라주!
        친구의 이름으로 뭉친 `세 얼간이`!
        삐딱한 천재들의 진정한 꿈을 찾기 위한 세상 뒤집기 한판이 시작된다!',
        '2011/08/18'
        ,DEFAULT
        ,DEFAULT
);

