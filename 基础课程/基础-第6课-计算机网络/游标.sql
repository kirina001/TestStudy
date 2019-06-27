/*如果存储过程存在，则删除重新创建*/
DROP PROCEDURE IF EXISTS saveScore;
/*创建过程*/
CREATE PROCEDURE saveScore()
BEGIN
	/*创建变量done，done=0表示还没有检索完，done=1表示检索完成*/
    DECLARE done INT DEFAULT 0;
	/*创建变量，保存查询结果中的姓名*/
    DECLARE sname VARCHAR(30) DEFAULT '';
	/*总成绩*/
	DECLARE sco INT DEFAULT 0;
	/*学号*/
	DECLARE sid INT DEFAULT 0;
	/*为查询语句创建游标mycursor，用来检索查询结果*/
    DECLARE mycursor CURSOR FOR SELECT student.sid,student.Sname,sum(score.score) from student LEFT JOIN score ON student.sid=score.sid GROUP BY student.sid;
    /*每一次检索，都判断是否检索到记录，如果没有，则设置done=1，表示检索完成*/
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	/*打开游标，开始检索*/
	OPEN mycursor;
	/*循环，检索操作*/
	REPEAT
		/*将检索的内容，保存到变量*/
	FETCH mycursor INTO sid,sname,sco;
	/*向结果表中插入数据，如果已经存在记录，则更新*/
	 INSERT INTO scoresum VALUES (sid,sname,sco) ON DUPLICATE KEY UPDATE score=sco;
	/*如果done=1，执行完成，则停止循环*/
	UNTIL done END REPEAT;
	/*关闭游标*/
	CLOSE mycursor;
END