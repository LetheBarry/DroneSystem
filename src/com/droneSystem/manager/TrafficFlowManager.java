package com.droneSystem.manager;



import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Transaction;

import com.droneSystem.hibernate.TrafficFlow;
import com.droneSystem.hibernate.TrafficFlowDAO;
import com.droneSystem.util.KeyValueWithOperator;


public class TrafficFlowManager {
	private TrafficFlowDAO m_dao = new TrafficFlowDAO();
	
	/**
	 * ����TrafficFlow Id ���� TrafficFlow����
	 * @param id TrafficFlow Id
	 * @return TrafficFlow����
	 */
	public TrafficFlow findById(int id) {
		return m_dao.findById(id);
	}

	/**
	 * ����һ��TrafficFlow��¼
	 * @param trafficFlow TrafficFlow����
	 * @return ����ɹ�������true�����򷵻�false
	 */
	public boolean save(TrafficFlow trafficFlow){
		Transaction tran = m_dao.getSession().beginTransaction();
		try {	
			m_dao.save(trafficFlow);
			tran.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			m_dao.closeSession();
		}
	}
	
	/**
	 * ����һ��TrafficFlow��¼
	 * @param trafficFlow TrafficFlow����
	 * @return ���³ɹ�������true�����򷵻�false
	 */
	public boolean update(TrafficFlow trafficFlow){
		Transaction tran = m_dao.getSession().beginTransaction();
		try {			
			m_dao.update(trafficFlow);
			tran.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			m_dao.closeSession();
		}
	}
	
	/**
	 * ����TrafficFlow Id,ɾ��TrafficFlow����
	 * @param id TrafficFlow id
	 * @return ɾ���ɹ�������true�����򷵻�false
	 */
	public boolean deleteById(int id){
		Transaction tran = m_dao.getSession().beginTransaction();
		try {			
			TrafficFlow u = m_dao.findById(id);
			if(u == null){
				return true;
			}else{
				m_dao.delete(u);
			}			
			tran.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			m_dao.closeSession();
		}
	}	
	
	/**
	 * ��ҳ����
	 * @param currentPage ��ǰҳ��
	 * @param pageSize ÿҳ�ļ�¼��
	 * @param arr ������ֵ��
	 * @return ��ҳ���User�б�
	 */
	public List<TrafficFlow> findPagedAll(int currentPage, int pageSize, KeyValueWithOperator...arr) {
		try {
			return m_dao.findPagedAll("TrafficFlow", currentPage,pageSize, arr);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * ��ҳ����
	 * @param currentPage ��ǰҳ��
	 * @param pageSize ÿҳ�ļ�¼��
	 * @return ��ҳ���Specification�б�
	 */
	public List<TrafficFlow> findPagedAll(int currentPage, int pageSize, List<KeyValueWithOperator> arr) {
		try {
			return m_dao.findPagedAll("TrafficFlow", currentPage, pageSize, arr);
		} catch (Exception e) {
			return null;
		}
	}
	
	
	/**
	 * �õ�����TrafficFlow��¼��
	 * @return TrafficFlow��¼��
	 */
	public int getTotalCount(KeyValueWithOperator...arr){
		return m_dao.getTotalCount("TrafficFlow", arr);		
	}
	
	/**
	 * �õ�����TrafficFlow��¼��
	 * @return TrafficFlow��¼��
	 */
	public int getTotalCount(List<KeyValueWithOperator> arr){
		return m_dao.getTotalCount("TrafficFlow",arr);		
	}
	
	/**
	 * ��������ϲ�ѯ
	 * @param instance ���������
	 * @return ���������ļ�¼
	 */
	public List findByExample(TrafficFlow instance) {
		return m_dao.findByExample(instance);
	}

	
	/**
	 * 
	 * @param arr
	 * @return
	 */
	public List<TrafficFlow> findByVarProperty(KeyValueWithOperator...arr){
		try{
			return m_dao.findByVarProperty("TrafficFlow", arr);
		}
		catch(Exception e){
			return null;
		}
	}
	
	/**
	* ��ҳ��ʾ����
	*@param queryString:��ѯ��䣨HQL��
	* @param currentPage
	* ��ǰҳ��, �� 1 ��ʼ
	* @param pageSize
	* ÿҳ��ʾ������
	* @param arr ��ѯ�����?��Ӧ��ֵ
	* @return ��ҳ��������б�- List
	*/
	public List findPageAllByHQL(String queryString, int currentPage, int pageSize, Object...arr){
		try{
			return m_dao.findPageAllByHQL(queryString, currentPage, pageSize, arr);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	* ��ҳ��ʾ����
	*@param queryString:��ѯ��䣨HQL��
	* @param currentPage
	* ��ǰҳ��, �� 1 ��ʼ
	* @param pageSize
	* ÿҳ��ʾ������
	* @param arr ��ѯ�����?��Ӧ��ֵ
	* @return ��ҳ��������б�- List
	*/
	public List findPageAllByHQL(String queryString, int currentPage, int pageSize, List<Object> arr){
		try{
			return m_dao.findPageAllByHQL(queryString, currentPage, pageSize, arr);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * �õ���¼����
	 * @param queryString ��ѯ��䣨HQL��
	 * @param arr ��ѯ�����?��Ӧ��ֵ
	 * @return
	 */
	public int getTotalCountByHQL(String queryString,Object...arr) {
		try{
			return m_dao.getTotalCountByHQL(queryString, arr);
		}catch(Exception ex){
			return 0;
		}
	}
	
	/**
	 * �õ���¼����
	 * @param queryString ��ѯ��䣨HQL��
	 * @param arr ��ѯ�����?��Ӧ��ֵ
	 * @return
	 */
	public int getTotalCountByHQL(String queryString,List<Object> arr) {
		try{
			return m_dao.getTotalCountByHQL(queryString, arr);
		}catch(Exception ex){
			return 0;
		}
	}
	
	/**
	* ����HQL����
	* @param updateString HQL��䣨update ���� set �ֶ�=ֵ where ������
	* @param arr ����
	* @return ���²���Ӱ��ļ�¼��
	*/
	public int updateByHQL(String updateString, Object...arr) {		
		Transaction tran = m_dao.getSession().beginTransaction();
		try{
			int i = m_dao.updateByHQL(updateString, arr);
			tran.commit();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return 0;
		}finally {
			m_dao.closeSession();
		}
	}
}
