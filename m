Return-Path: <linux-hwmon+bounces-13776-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAorFN3b+WkwEwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-13776-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 05 May 2026 14:00:29 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C04CD233
	for <lists+linux-hwmon@lfdr.de>; Tue, 05 May 2026 14:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F209A3011F4D
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 May 2026 11:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841F33DA5AB;
	Tue,  5 May 2026 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frmqDrVX"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129B3C13E9;
	Tue,  5 May 2026 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981646; cv=none; b=eoknaAlb7uU1jPTuTKDPgF7M3kxY1tbt82tQX7tzvOhvcRXuKXSmUduXO8B1WBkXvxUCiYGT9BM2AeUHzmNWSDoExD6tvbZk0isj4eMKXO/xXhaEkk/iA2gwSnGjNHHYzcIj6wPSSvgvfKh5ojPTY8pu53Fk5+agfFCriOkVEhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981646; c=relaxed/simple;
	bh=TG8FaSeVMfxVnwLkN4pKqSqOOyBkYNLu696VS0Mrf3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M1aLhoMkoIHJ75XvvY/n5YE1ggfnS3njk1QT1wKXxTU6K2yqU2c0/pEtTUJzqTgYclw3d8Z44DY1L/ZAgM+2ZU1z3+mr2ePq3YsejQd41ojUDjrmT9A7TskLGYxoUrVZsf92drEW4WsjWMcD0G3LdDnuQABdwpi/5TcyC4EE6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frmqDrVX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68413C2BCB4;
	Tue,  5 May 2026 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777981646;
	bh=TG8FaSeVMfxVnwLkN4pKqSqOOyBkYNLu696VS0Mrf3Q=;
	h=From:To:Cc:Subject:Date:From;
	b=frmqDrVXeGY3u44ovo6+2ExxyUEhaUVVgZe97w95e3RXthn+La+NJx6E8lYE9RAhB
	 eZUaMS369J4oZchg6/nGL1MKTxrNlAJTPD0eKzr+qI+keYDkh5rtBdP8O61eUpq81Q
	 4ue397yz7ItDDOzOumMxoGsMEbm0o2gx92ZrwN1AAufmJC4i3iX84UVPDJqxDwYZd0
	 qjd6jyPuNGl0PZro7GPiMl8MhyNB2CJWF6YPtAKCAAvvE5Ho/vZ5bBkq7/HJQ/VwlF
	 yfYweLZnw2QM28mbRCQrVqTAwkXlo9f/ffYIg7gJJ5+uq2WiWD1YwfhhjbEPy6g8ka
	 4vbrwfVelIgdQ==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux PM <linux-pm@vger.kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Armin Wolf <w_armin@gmx.de>, Jiajia Liu <liujiajia@kylinos.cn>,
 Marc Zyngier <maz@kernel.org>, linux-hwmon@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject:
 [PATCH v2 0/3] thermal: hwmon: Rework of automatic hwmon device registration
Date: Tue, 05 May 2026 13:35:19 +0200
Message-ID: <6017595.DvuYhMxLoT@rafael.j.wysocki>
Organization: Linux Kernel Development
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2C8C04CD233
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,arm.com,gmx.de,kylinos.cn,kernel.org,roeck-us.net];
	TAGGED_FROM(0.00)[bounces-13776-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rafael.j.wysocki:mid,sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi All,

This is an update of

https://lore.kernel.org/linux-pm/5100596.31r3eYUQgx@rafael.j.wysocki/

sent mosty to address feedback from sashiko.dev:

https://sashiko.dev/#/patchset/5100596.31r3eYUQgx%40rafael.j.wysocki

There is an extra patch in this revision (the first one) that addresses
a possible thermal hwmon removal issue pointed out by sashiko.dev.

The second patch in the series reworks the automatic registration of hwmon
devices for thermal zones so that one hwmon device is registered for each of
them.  This is done to address a thermal zone removal deadlock related to the
sharing of a hwmon device with other thermal zones of the same type (see the
changelog of patch [2/3] for details).

The last patch simplifies the thermal hwmon code further by using the
canonical mechanism for registering extra sysfs attributes of hwmon devices
instead of manually adding files to sysfs.

The patches are targeted at 7.2.

Thanks!




