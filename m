Return-Path: <linux-hwmon+bounces-14879-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id shTaL1xkJ2prvwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14879-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 02:54:52 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D85765B77D
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 02:54:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RZYMpwZQ;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14879-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14879-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1CAC30504F7
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2026 00:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB73285CB6;
	Tue,  9 Jun 2026 00:52:20 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669B3282F0A;
	Tue,  9 Jun 2026 00:52:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780966340; cv=none; b=QryesBsHYY4SofvY8Wd1KDyzlSg4leyJu2GFvAH1roZrwiL1wNEfByAK0qy4aGCid62UBCmA952yXQR6+vxpNupcvjg3Jv/07Pe3OybTZ6HC92vRKa4DC90UrQEtNXAmSWYkspxRF7NbDFgd4W8Hn5gLqYv8Vq0kAN6KkOoK5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780966340; c=relaxed/simple;
	bh=N6BzSSb+OgMfdk97YJef7V8jWS7EXnX+s7PFvYz+1lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lgkhANZLvLWwGVTiQMCNYwz09maG3meOZ8J7Ru4gGVi/lPm9bMwZB1DNG+7aAKmjGNlueOfE9WAxJqMoBRYPr+BdqXNSw4eVzAnb8ZwwT41ShYkfhjfUWzXwBObqNlV/ziamCqiUdpKo4VPVGNVjxZ5wmm5o9T5cZZVXfdXSmac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZYMpwZQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7FA1F0089A;
	Tue,  9 Jun 2026 00:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780966339;
	bh=N6BzSSb+OgMfdk97YJef7V8jWS7EXnX+s7PFvYz+1lA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RZYMpwZQ2U5mkNkk631MTiG6LR+IUelwqNf1hcraIihb1hh7GhL2uUlgpbRRLdMGq
	 ugItmKgP5LMJgQsiz/LtxstXQZrugXqCM5ukIFo6CuxypHkVLACpBHyq9bR+/NLiPO
	 KFGOn4oQRPj1OR2tyrIzXE2TDswPcQeMlFvUEK7xLRnzE14l+gAXvzeaVtNcuFHfop
	 Qwc3o+q30P+IlMq7smZh7V7cTO7F32YkcZi4ZFfbVuIsRy7Ut/IAH8rhZCK3WhanJe
	 ibmywaFo66n7b8LuZug26AGffay9TKvefXURYfTGFFODtpqWCSstpjMmDGPlAJu0K4
	 297rjsEvfvzaA==
From: Sasha Levin <sashal@kernel.org>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	linux@roeck-us.net
Cc: Sasha Levin <sashal@kernel.org>,
	patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jdelvare@suse.com,
	atull@opensource.altera.com,
	broonie@kernel.org,
	linux-hwmon@vger.kernel.org,
	psanman@juniper.net,
	Fang Wang <32840572@qq.com>
Subject: Re: [PATCH 6.6.y] hwmon: (pmbus/core) Protect regulator operations with mutex
Date: Mon,  8 Jun 2026 20:51:56 -0400
Message-ID: <20260608-stable-reply-0010@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <tencent_53D6CAB7A20BCE168EA9DF22F0E78EF14509@qq.com>
References: <tencent_53D6CAB7A20BCE168EA9DF22F0E78EF14509@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-14879-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,m:linux@roeck-us.net,m:sashal@kernel.org,m:patches@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jdelvare@suse.com,m:atull@opensource.altera.com,m:broonie@kernel.org,m:linux-hwmon@vger.kernel.org,m:psanman@juniper.net,m:32840572@qq.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,vger.kernel.org,suse.com,opensource.altera.com,juniper.net,qq.com];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D85765B77D

> [PATCH 6.6.y] hwmon: (pmbus/core) Protect regulator operations with mutex

Queued for 6.6, thanks.

--
Thanks,
Sasha

