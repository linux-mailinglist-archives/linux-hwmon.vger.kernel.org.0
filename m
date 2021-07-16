Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF303CB990
	for <lists+linux-hwmon@lfdr.de>; Fri, 16 Jul 2021 17:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240665AbhGPPWZ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 16 Jul 2021 11:22:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5278 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233094AbhGPPWY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Jul 2021 11:22:24 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GFJ4bC024536;
        Fri, 16 Jul 2021 11:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=41Q8ygsUEknL9hYXACCQxRpsfIskznG//w5W3efVH6c=;
 b=ArgqhHyGDc8Dj+dr68AYYt9CImW8b++5Oi1OOQSFBUltTLXReBhtjdh3aJStyFN9SphL
 aICJBDJNXTjhcuJl/qDy2VJ5+qGnU9zDd+MCQ8xoZuaZmVhHpV7aTXYG128+vcDLTHaV
 EKgshSMtNueZyvgUBmKLMtqO/mFv3xllkLZvGe4YY5lg8fyD53M2viN35BjhsLyumg9A
 crQhld8cFAkF0VpNwnfuA+sRddtksF0aBwuGwGMyqCbwmvSTywWHvF1YTPTCyodNgPgW
 OFWiTvXfXJEv3Inqi4Om4+1aUMfPsbdCP+YM7aTTGuqwIi38f+loLvX72pO3SyYxo8+e jg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39twha8n29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 11:19:07 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GFGhhu000796;
        Fri, 16 Jul 2021 15:19:00 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma04wdc.us.ibm.com with ESMTP id 39q36ef827-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 15:19:00 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GFIxSZ48693742
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 15:18:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 34A0AC6057;
        Fri, 16 Jul 2021 15:18:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BB87FC605F;
        Fri, 16 Jul 2021 15:18:58 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 15:18:58 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-hwmon@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux@roeck-us.net, jdelvare@suse.com, jk@ozlabs.org,
        joel@jms.id.au, alistair@popple.id.au, openbmc@lists.ozlabs.org,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 1/3] fsi: occ: Force sequence numbering per OCC
Date:   Fri, 16 Jul 2021 10:18:48 -0500
Message-Id: <20210716151850.28973-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716151850.28973-1-eajames@linux.ibm.com>
References: <20210716151850.28973-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hD8Pqiz4lZO1kkv_Tzc7KoFA1ebrp4il
X-Proofpoint-GUID: hD8Pqiz4lZO1kkv_Tzc7KoFA1ebrp4il
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_05:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160092
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Set and increment the sequence number during the submit operation.
This prevents sequence number conflicts between different users of
the interface. A sequence number conflict may result in a user
getting an OCC response meant for a different command. Since the
sequence number is now modified, the checksum must be calculated and
set before submitting the command.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-occ.c | 54 +++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index b223f0ef337b..ecf738411fe2 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -50,6 +50,7 @@ struct occ {
 	struct device *sbefifo;
 	char name[32];
 	int idx;
+	u8 sequence_number;
 	enum versions version;
 	struct miscdevice mdev;
 	struct mutex occ_lock;
@@ -141,8 +142,7 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 {
 	struct occ_client *client = file->private_data;
 	size_t rlen, data_length;
-	u16 checksum = 0;
-	ssize_t rc, i;
+	ssize_t rc;
 	u8 *cmd;
 
 	if (!client)
@@ -156,9 +156,6 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 	/* Construct the command */
 	cmd = client->buffer;
 
-	/* Sequence number (we could increment and compare with response) */
-	cmd[0] = 1;
-
 	/*
 	 * Copy the user command (assume user data follows the occ command
 	 * format)
@@ -178,14 +175,7 @@ static ssize_t occ_write(struct file *file, const char __user *buf,
 		goto done;
 	}
 
-	/* Calculate checksum */
-	for (i = 0; i < data_length + 4; ++i)
-		checksum += cmd[i];
-
-	cmd[data_length + 4] = checksum >> 8;
-	cmd[data_length + 5] = checksum & 0xFF;
-
-	/* Submit command */
+	/* Submit command; 4 bytes before the data and 2 bytes after */
 	rlen = PAGE_SIZE;
 	rc = fsi_occ_submit(client->occ->dev, cmd, data_length + 6, cmd,
 			    &rlen);
@@ -314,11 +304,13 @@ static int occ_getsram(struct occ *occ, u32 offset, void *data, ssize_t len)
 	return rc;
 }
 
-static int occ_putsram(struct occ *occ, const void *data, ssize_t len)
+static int occ_putsram(struct occ *occ, const void *data, ssize_t len,
+		       u8 seq_no, u16 checksum)
 {
 	size_t cmd_len, buf_len, resp_len, resp_data_len;
 	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
 	__be32 *buf;
+	u8 *byte_buf;
 	int idx = 0, rc;
 
 	cmd_len = (occ->version == occ_p10) ? 6 : 5;
@@ -358,6 +350,15 @@ static int occ_putsram(struct occ *occ, const void *data, ssize_t len)
 	buf[4 + idx] = cpu_to_be32(data_len);
 	memcpy(&buf[5 + idx], data, len);
 
+	byte_buf = (u8 *)&buf[5 + idx];
+	/*
+	 * Overwrite the first byte with our sequence number and the last two
+	 * bytes with the checksum.
+	 */
+	byte_buf[0] = seq_no;
+	byte_buf[len - 2] = checksum >> 8;
+	byte_buf[len - 1] = checksum & 0xff;
+
 	rc = sbefifo_submit(occ->sbefifo, buf, cmd_len, buf, &resp_len);
 	if (rc)
 		goto free;
@@ -467,9 +468,12 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 	struct occ *occ = dev_get_drvdata(dev);
 	struct occ_response *resp = response;
 	u8 seq_no;
+	u16 checksum = 0;
 	u16 resp_data_length;
+	const u8 *byte_request = (const u8 *)request;
 	unsigned long start;
 	int rc;
+	size_t i;
 
 	if (!occ)
 		return -ENODEV;
@@ -479,11 +483,26 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 		return -EINVAL;
 	}
 
+	/* Checksum the request, ignoring first byte (sequence number). */
+	for (i = 1; i < req_len - 2; ++i)
+		checksum += byte_request[i];
+
 	mutex_lock(&occ->occ_lock);
 
-	/* Extract the seq_no from the command (first byte) */
-	seq_no = *(const u8 *)request;
-	rc = occ_putsram(occ, request, req_len);
+	/*
+	 * Get a sequence number and update the counter. Avoid a sequence
+	 * number of 0 which would pass the response check below even if the
+	 * OCC response is uninitialized. Any sequence number the user is
+	 * trying to send is overwritten since this function is the only common
+	 * interface to the OCC and therefore the only place we can guarantee
+	 * unique sequence numbers.
+	 */
+	seq_no = occ->sequence_number++;
+	if (!occ->sequence_number)
+		occ->sequence_number = 1;
+	checksum += seq_no;
+
+	rc = occ_putsram(occ, request, req_len, seq_no, checksum);
 	if (rc)
 		goto done;
 
@@ -574,6 +593,7 @@ static int occ_probe(struct platform_device *pdev)
 	occ->version = (uintptr_t)of_device_get_match_data(dev);
 	occ->dev = dev;
 	occ->sbefifo = dev->parent;
+	occ->sequence_number = 1;
 	mutex_init(&occ->occ_lock);
 
 	if (dev->of_node) {
-- 
2.27.0

