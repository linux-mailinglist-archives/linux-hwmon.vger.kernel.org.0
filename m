Return-Path: <linux-hwmon+bounces-12042-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMLsNpT9pmk7bgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-12042-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 03 Mar 2026 16:26:12 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 810DC1F28B4
	for <lists+linux-hwmon@lfdr.de>; Tue, 03 Mar 2026 16:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 957FC303ACBA
	for <lists+linux-hwmon@lfdr.de>; Tue,  3 Mar 2026 15:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C8E48B374;
	Tue,  3 Mar 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="qYUBkaVD";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="HPrcGtAv"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AC348C3EF
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551525; cv=none; b=F8W3ES1UgfRu5BfHENRQ7HAI2wNLXek1OFcoIweIT21D8U3Mprvms5Ufo70BT/+EhV+SwCGkXfhggysJLvqnSkjIy+loPmoezH5G4YwXJ31tNFALBN5TcbULaV4tcz/7CZf4d4RXHOo706QNqgD6Lv6pbeFDdPBRZpqjbbp9FAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551525; c=relaxed/simple;
	bh=a4iMqy/fW5/A5lSOCsK4qMP6nEqheUwfM351dNzJtdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LZ5fRIr4Eqa2ahvgK6P5SNyhkc0jJTb4bmiRm5xPDwNOV7PVzpi+Ktkg4+g2EeZe+p2R6q6bBjUcHt+Cc/TF5ZCpQzHzypvvN9Fsl6wSwPTjBw9bvrAVO8NvIMycg8gTpzOLaqPDwlH1eZ1DYaNsdk6CptDfsni85p5fpM9r8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=qYUBkaVD; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=HPrcGtAv; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=qYUBkaVDz6KF98QkdJJ7xWs627+dOHb6oF4OFSIifH3fP/0r61TjA7GQ7CaxszNazm2iIIuEn+QT4IR0K3IloAA09vI3QU/yS0kL8P3qt/AEF3Hrk4v+jYFXbIO0HQC9Bc9/7yy/CVGw/jzhcDsrtPPsau2mdQZdEtSOjO09iq0g0pp/H4HHalv1/eSOCgxzbKR9yII+xHTDp8S8XHNaRzAsjywTlY9AkVmk/a8JLUUFNjuTX1+QcgXep+VFcSnz6EVvN7AX8NixZZzPs+KViu8J40g9uv6vR7w+Y9N06silPDPE6M3BaXjM8jLaCI9Do4T/LaefiPm7sNCVKHpMnQ==; s=purelymail3; d=turingtested.xyz; v=1; bh=a4iMqy/fW5/A5lSOCsK4qMP6nEqheUwfM351dNzJtdY=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=HPrcGtAvXnk2eY9/+LWGbBQKJW+qOUO9roBTeUXYDPrcrNL5c9VMW/Qh4QuoUxdTUzG+CRvpBFQlKupJg2ZncE+oRZC5OdVYNoYDiXxJ2hUal1NIrafRf50qBOlH3oLxLBi/nZyYY/4Dv9zHw7qCkMqbYvGl9fT75S1teq1tkYHOfM0hTtmhO0bIPpeWWd/wTsx8CO2MZHiv33bikW0sW6BWLr5EjFhRyXOmrWjHUqOR+Oj7cfUUtgAsjHyOb88r7AA/caKNJYgNbhU/lC/JzPL0/vZgbNdg8s66QBkmHUTMZvGSJPu++frYvvCurIrV7F8LmoljcDgaPYZGaObRXw==; s=purelymail3; d=purelymail.com; v=1; bh=a4iMqy/fW5/A5lSOCsK4qMP6nEqheUwfM351dNzJtdY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1339122984;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 03 Mar 2026 15:25:18 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH v2 0/5] hwmon: Replace sprintf() with sysfs_emit()
Date: Tue,  3 Mar 2026 20:54:51 +0530
Message-ID: <20260303152456.35763-1-tt@turingtested.xyz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Queue-Id: 810DC1F28B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[turingtested.xyz,reject];
	R_DKIM_ALLOW(-0.20)[turingtested.xyz:s=purelymail3,purelymail.com:s=purelymail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12042-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[turingtested.xyz:+,purelymail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tt@turingtested.xyz,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,turingtested.xyz:dkim,turingtested.xyz:mid]
X-Rspamd-Action: no action

This series replaces sprintf() with sysfs_emit() in several hwmon
drivers when writing to sysfs buffers.

sysfs_emit() performs proper bounds checking and is the preferred
helper for sysfs output.

No functional changes intended.

Changes in v2:

1. Use imperative mood in commit messages

2. Format subjects as "hwmon: (driver) ..."

3. Remove redundant driver name from commit descriptions

Amay Agarwal (5):
  hwmon: (tc74) Replace sprintf() with sysfs_emit()
  hwmon: (max31722) Replace sprintf() with sysfs_emit()
  hwmon: (ads7828) Replace sprintf() with sysfs_emit()
  hwmon: (max6650) Replace sprintf() with sysfs_emit()
  hwmon: (emc1403) Replace sprintf() with sysfs_emit()

 drivers/hwmon/ads7828.c  | 2 +-
 drivers/hwmon/emc1403.c  | 2 +-
 drivers/hwmon/max31722.c | 3 ++-
 drivers/hwmon/max6650.c  | 3 ++-
 drivers/hwmon/tc74.c     | 2 +-
 5 files changed, 7 insertions(+), 5 deletions(-)

--=20
2.53.0


