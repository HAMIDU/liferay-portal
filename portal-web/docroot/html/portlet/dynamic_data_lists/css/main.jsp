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

<%@ include file="/html/portlet/css_init.jsp" %>

.portlet-dynamic-data-lists {
	.lfr-spreadsheet-add-rows-buttons {
		padding: 5px;

		.yui3-aui-field-label {
			text-transform: lowercase;
		}
	}
}

.yui3-skin-sam .lfr-spreadsheet-container {
	.yui3-datatable td {
		border-color: #ccc;
		border-style: solid;
		border-width: 0 1px 1px 0;
	}

	.yui3-datatable-liner {
		height: 17px;
		padding: 1px 10px;
	}

	.yui3-datatable-scrollable .yui3-datatable-bd {
		background-color: #f2f2f2;
	}

	tr.yui3-datatable-odd {
		background-color: #fff;

		td.yui3-datatable-asc, td.yui3-datatable-desc {
			background-color: #EDF5FF;
		}

		td.yui3-datatable-asc.yui3-aui-datatable-cell-selected, td.yui3-datatable-desc.yui3-aui-datatable-cell-selected {
			background-color: #6688EE;
		}
	}
}

.yui3-aui-basecelleditor {
	z-index: 999 !important;

	.yui3-aui-buttonitem-content {
		padding: 3px 3px 2px 1px;
	}

	[class~="yui3-aui-form-validator-message"] {
		clip: auto;
		width: auto;
	}
}

.webkit .yui3-aui-basecelleditor .yui3-aui-buttonitem-label-only {
	padding-bottom: 2px;
}