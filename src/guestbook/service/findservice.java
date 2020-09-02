package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class findservice {
	private static findservice instance = new findservice();

	public static findservice getInstance() {
		return instance;
	}

	private findservice() {
	}

	public MessageListView getMessageList(String name) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();

			int messageTotalCount = messageDao.selectCount(conn);

			List<Message> messageList = null;
				if (messageTotalCount > 0) {
				messageList =
						messageDao.findList(conn, name);
			} else {
				messageList = Collections.emptyList();
			}
			return new MessageListView(messageList);
		} catch (SQLException e) {
			throw new ServiceException("목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}