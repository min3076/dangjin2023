<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="net.acego.common.util.*"%>
<%
	String code = request.getParameter("code");

	if (code == null)
		code = "01";

	int codeLen = code.length();
	if (codeLen < 4)
		codeLen = 2;

	String code1 = code.substring(0, 2); // 1단계 코드
	String siteCode = (String) request.getAttribute("siteCode");
	
	List<XmlBean> beanList = (List<XmlBean>) request.getAttribute("xmlCmsList");
	StringBuffer buf = new StringBuffer();
	XmlBean bean = null;
%>
 
<!-- 사이트맵 -->
<div id="sitemap" class="ui-content-block">

	<%
		int idx = 0;
		int na = 0;
		if (beanList != null && beanList.size() > 0) {
			for (int k = 0; k < beanList.size(); k++) {
				idx++;
				bean = beanList.get(k);
				if (bean.getMdir().equals("sitemap"))
					break;

				//1단계
				buf.append("<div class=\"amThum\">");
				buf.append("<h2 class=\"site0" + idx + "\"><span>"
						+ bean.getTitle() + "</span></h2>");
				buf.append("<div class=\"sitemap_grep\">");
				k++;
				for (int m = k; m < beanList.size(); m++) {
					bean = beanList.get(m);

					if (bean.getDepth().equals("2")) {
						// 2단계
						buf.append("<ul class=\"sitemap_list\">");
						buf.append("<li><a href=\"" + bean.getLinkUrl()
								+ "\" target='" + bean.getLinkTarget()
								+ "' class='first'><span>" + bean.getTitle() + "</span></a>");

						m++;
						if (m < beanList.size()) {
							bean = beanList.get(m);

							if (bean.getDepth().equals("4")) {
								buf.append("</li>");

								m = m - 1;
								continue;
							}

							String check3Depth = "N";
							if (bean.getDepth().equals("3")) {
								buf.append("<ul>");

								for (int x = m; x < beanList.size(); x++) {
									bean = beanList.get(x);
									if (bean.getDepth().equals("3")) {
										buf.append("<li><a href=\""
												+ bean.getLinkUrl()
												+ "\" target='"
												+ bean.getLinkTarget()
												+ "'><span>"
												+ bean.getTitle()
												+ "</span></a></li>");
									} else if (bean.getDepth().equals("4")) {
										// 4단계는 그냥 지나감 
										continue;
									} else {
										// 1,2단계인 경우 m값을 하나 줄이고 나감
										m = x - 1;
										break;
									}
								}

								buf.append("</ul>");
								check3Depth = "Y";
							} else if (bean.getDepth().equals("4")
									&& check3Depth.equals("N")) {
								buf.append("</li>");
								// 4단계는 그냥 지나감 
								m = m - 1;
								continue;
							} else if (bean.getDepth().equals("4")) {

								// 4단계는 그냥 지나감 
								m = m - 1;
								continue;
							} else {
								// 1단계인 경우 k값을 하나 줄이고 나감

								m = m - 1;
								bean = beanList.get(m);
							}
						}

						buf.append("</li>");
					} else if (bean.getDepth().equals("3")
							|| bean.getDepth().equals("4")) {
						// 3단계 , 4단계는 그냥 지나감 
						continue;
					} else {
						// 1단계인 경우 k값을 하나 줄이고 나감
						k = m - 1;
						break;
					}

					buf.append("</ul>");
					//buf.append("</div>");

				}

				buf.append("</div>");
				buf.append("</div>");

			}
		}
		out.println(buf.toString());
	%>

</div>
<!-- //사이트맵 -->
