<%@ tag body-content="empty" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="attributename" type="com.model.Page" required="true" rtexprvalue="true" %>
<script src="../static/js/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="../static/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
        layui.use(['laypage', 'layer'], function () {
            var laypage = layui.laypage
                ,layer = layui.layer;
            laypage.render({
                elem: 'page'
                , count: '${attributename.count}'
                , limit: '${attributename.size}'
                , theme: '#1E9FFF'
                , curr:'${attributename.index + 1}'
                , layout: [ 'prev', 'page', 'next', 'limit', 'count','skip']
                , jump: function (obj,first) {
                    if(!first){
                        $('input[name="index"]').val(obj.curr - 1);
                        $('input[name="size"]').val(obj.limit);
                        $('#search').click();
                    }
                }
            });
        })
</script>