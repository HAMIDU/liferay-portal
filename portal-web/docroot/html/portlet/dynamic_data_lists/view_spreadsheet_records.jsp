<%--
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/portlet/dynamic_data_lists/init.jsp" %>

<%
DDLRecordSet recordSet = (DDLRecordSet)request.getAttribute(WebKeys.DYNAMIC_DATA_LISTS_RECORD_SET);

PortletURL portletURL = renderResponse.createRenderURL();

portletURL.setParameter("struts_action", "/dynamic_data_lists/view_entry");
portletURL.setParameter("entryId", String.valueOf(recordSet.getRecordSetId()));

DDMStructure ddmStructure = recordSet.getDDMStructure();

List<DDLRecord> results = DDLRecordLocalServiceUtil.getRecords(recordSet.getRecordSetId(), 0, 1000, (OrderByComparator)null);

JSONArray recordSetJSON = DDLUtil.getRecordSetJSONArray(recordSet);

JSONArray recordsJSON = DDLUtil.getRecordsJSONArray(results);

JSONArray structureJSON = DDMXSDUtil.getJSONArray(ddmStructure.getXsd());

int totalEmptyRecords = Math.max(recordSet.getMinDisplayRows(), results.size()) - results.size();
%>

<div class="lfr-spreadsheet-container">
	<div id="<portlet:namespace />spreadsheet">
		<div class="yui3-widget yui3-datatable" id="<portlet:namespace />dataTableBB">
			<div class="yui3-datatable-scrollable yui3-datatable-content" id="<portlet:namespace />dataTableCC"></div>
		</div>
	</div>

	<div class="lfr-spreadsheet-add-rows-buttons">
		<aui:button inlineField="<%= true %>" name="addRecords" value="add" />

		<aui:select inlineField="<%= true %>" inlineLabel="right" label="more-rows-at-bottom" name="numberOfRecords">
			<aui:option value="1">1</aui:option>
			<aui:option value="5">5</aui:option>
			<aui:option value="10">10</aui:option>
			<aui:option value="20">20</aui:option>
			<aui:option value="50">50</aui:option>
		</aui:select>
	</div>
</div>

<aui:script use="liferay-portlet-dynamic-data-lists">
var keys = [];

var columnset = Liferay.LiferaySpreadSheet.buildDataTableColumnset(<%= recordSetJSON.toString() %>, <%= structureJSON.toString() %>);

A.Array.each(
	columnset,
	function(column) {
		keys.push(column.key);
	}
);

var recordset = Liferay.LiferaySpreadSheet.buildEmptyRecords(<%= totalEmptyRecords %>, keys);

A.Array.each(
	<%= recordsJSON.toString() %>,
	function(record) {
		recordset.splice(record.displayIndex, 0, record);
	}
);

window.<portlet:namespace />spreadSheet = new Liferay.LiferaySpreadSheet(
	{
		boundingBox: '#<portlet:namespace />dataTableBB',
		columnset: columnset,
		contentBox: '#<portlet:namespace />dataTableCC',
		editEvent: 'dblclick',
		recordset: recordset,
		recordsetId: <%= recordSet.getRecordSetId() %>
	}
)
.plug(
	A.Plugin.DataTableScroll,
	{
		height: 700,
		width: 900
	}
)
.plug(
	A.Plugin.DataTableSelection,
	{
		selectEvent: 'mousedown'
	}
)
.plug(A.Plugin.DataTableSort)
.render('#<portlet:namespace />spreadsheet');

window.<portlet:namespace />spreadSheet.get('boundingBox').unselectable();

var numberOfRecordsNode = A.one('#<portlet:namespace />numberOfRecords');

A.one('#<portlet:namespace />addRecords').on(
	'click',
	function(event) {
		var numberOfRecords = parseInt(numberOfRecordsNode.val(), 10) || 0;

		var recordset = <portlet:namespace />spreadSheet.get('recordset');

		<portlet:namespace />spreadSheet.addEmptyRows(numberOfRecords);

		<portlet:namespace />spreadSheet.updateMinDisplayRows(recordset.getLength());
	}
);
</aui:script>