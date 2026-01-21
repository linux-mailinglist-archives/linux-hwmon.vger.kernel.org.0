Return-Path: <linux-hwmon+bounces-11369-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBYYMG9AcWn2fgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-11369-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 22:09:03 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A25DD25
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 22:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5400AACDA5A
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 21:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E36425CC6;
	Wed, 21 Jan 2026 21:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b="qfWGJxXo"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E413176EB
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Jan 2026 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029238; cv=pass; b=cWcQy1usR2TvWZ1sE4j/ErpvOpaiWSYpOXWlQYRzNwTzKerGw5/4LS9F47er2cAkxbtL2ZJ3PJTd4wUS9Tu+pN164n0VY/gbJ4sElxA0f8aB36MkJ/Vbg5XhIOP/k/FCdRu6RBwCWyu++KFFM/RUu/+Yh7+nqP43CvBxpByR2TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029238; c=relaxed/simple;
	bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPCGUFpVrHkSaNpheSckhkBciA6YE0HiCHkysWefo0JKgh8ply4q9zaMEK94xWQhxIHJlW1+WPx2lm48cuda/HiaB/eJpGn2WWLJ4psCGRlkRCnsZF7eGni77nhUGKXETOR04NAAGtK7aePbzky4MMkmdtAgLfQPfXnHmMBEXgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b=qfWGJxXo; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7927b1620ddso4423417b3.0
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Jan 2026 13:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769029234; cv=none;
        d=google.com; s=arc-20240605;
        b=ZjZTBtBWYvbBUtLjswLs6yrcvAyYNzDwX6yysT6pVhURiOvPa4gnAJJVjzkUVGTphe
         mgUoElmrGhkni/r2ebSIPY8rRfQGYN5CbhOLxjk9vrLX0Tk1Rbw6T/9uoxLSTuCQa96A
         MFzMe+xYysJwr/F6h+erSUpM9OEeVve8KgEAbRK+pm8f5KyJzUdQXNxOZ2q6L8MHrg1i
         s6ajXhe5PfDNOhCza8/Su6kk4CF/dTf0gttuegMsTWBVNNF1xJUXLnaQ2G+dlX+aji2u
         aWk75zrSadfKQcmDbH+tQSW7hZkQdKIVoMTSFpsGnCJ30VmlinaXJdao5ulYstP6v4vc
         ycBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        fh=3+29vIjA6+mei6CDddvJtw/FtJeVps7Wnr6qn2eZvzs=;
        b=L4Da2fkN+kYRi76gtzUy22lYyobfdgt1bI1TEfVQGd8tBVH50vQxtPkKSlu/xu6RO0
         D1pxHnTCVg4FaBM+kLCM4Obc9sFOKhJYbO/IiMhTxVaZMz6fdQhc8No5TxGrftcQ3k/U
         YuMqwesgfcN0qqdTznvJUEz5OtleUqOBdLZzpF6aZ8dZHcTtRPXEbfAX5dW75zBkJW+V
         5ShjA1MUdH+2vshRxJAQ0grfRdMlv1a1+I6fQ4MJVblgvQeDuHnoQTgUhcv+oFxWgRsP
         4pZzEa7wmOU/BAsYyChMPw5c/mk3CZ1aQcqVoP5CIwyzA2qeMq78hrgh74uK+2LWWWn2
         fhgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett.net; s=google; t=1769029234; x=1769634034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        b=qfWGJxXoRy0nxjszGi+6dZEAOnp/FuW9nvHUikBmaJ62ioKtSVfqfGcIIjqdSr45Ho
         rg4lBazh59heSZNx7SSOrBo26KLOKnzvBmhc4xgnlcljiMUKIOyz+Hvh5U+yV2XOmxRo
         5JKxWnu6jwAvD8Doi7ldT9Oyhke0I9kDPe7zdxXicDLYAu94IMvU4gg92PTcZdpiO4b7
         oqqt+33Jd86uX8JChcIb9Rq62aj/pfZKg9GxYD6YM7yagxEUjcyE0MlBpP5r+p8gFdNM
         J3DI5YO3dayheSj/guy66jMmTyrIj7s147iSYMKAJUrIdrMRYGwuU3B0lWpcbxty8G4F
         aa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029234; x=1769634034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TOB6RppBWiqtDs1Qt/C5GSv+egVwr4macHemePOt6fU=;
        b=lRle64I+VLOb4xkKmSIw7YAI6FdSA/+ZYN2OGoDnDCyxQJAyFONU7sDTkg7zrMppI2
         D8jUSFUcJU4N7kmufHaltXB3EzymImEQSN8nqm2+3p8CZ1Qy37VoiyPm92+waN/eO5QG
         9MPBPGxoR6RTxQmePdSLIyXWYXkKcRpmrOs+3kifbPHPCcQQjZWQqFXEgmHE8/uvUHYn
         SivQKErBLZGmr+PtanQfFfMZXxxS+/Jo6AnalB4dT2G2hscxoESAvgAtz294lMEAkk1T
         X1ONBh48MGYw/ECm/8D5+m2BIQJOzAhXNfhafSXujiz4a5cx1HvHaelBSftlr6d0GPOx
         lShw==
X-Forwarded-Encrypted: i=1; AJvYcCXPJFHQgH5MQnMQ314FEQIM1J3nD4YcvItHK34Ndm2bcNppGQWKMjIrrwb222+pr6lcbP03LGS2XTACIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfr43Jxrj9ciBZj5nIkmOK+SWvqBXsaMcYuNLmvJ4qhbYAkPtB
	TmXkiVPeEoc4jctp82wMNI/k/vVLx99zipx4X4MMWvc7BYrXAm/1wJk/sCq1QcxzdUMXdqrNomH
	fie68YQasA4CaCskFbJpXCUlLRNou3Kv5yJJwbhVSgXVLQ0gdDCqljw==
X-Gm-Gg: AZuq6aIJHcq6hejP2akGVmkxdOmzeDeqGtP/YzHeZP3s0Je361yKQJ4XPMsHLgxDHTl
	iZsHKw/EyT79rfU0iNTC/I5QJoAomR0Mw+UROMpvrBvn9f6tUlefMWefNCU46gcodatmKQAUJJp
	z9nU9dnX/FicWM+23uxl8NF8Vqg7Se9UlqLjf5yLrLD9RVKfyjGd/YjOcMgMPwNUbxCgwYAwfxJ
	fpzWWmwb1Fda39UuH9H0Y0VrBkjk+oET9MFvyDGaOuOCgBNd+Hqx5RnxVncMbrZJqCvS0J6
X-Received: by 2002:a05:690c:6c89:b0:78f:cc97:f8c3 with SMTP id
 00721157ae682-7942a823863mr6872937b3.32.1769029233841; Wed, 21 Jan 2026
 13:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
From: Dustin Howett <dustin@howett.net>
Date: Wed, 21 Jan 2026 15:00:24 -0600
X-Gm-Features: AZwV_QjEkOnOrkGBOFHQRskKtLJqCO6O_X6k3EbAJUB8sn6lDOvPd9EiYufqiA4
Message-ID: <CA+BfgNLgZBDxtPQM+s4Q6PXnNHWGKXmSAaoMFdHnfFphK9aAig@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hwmon: (cros_ec) Fan target and temperature thresholds
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, Stephen Horvath <s.horvath@outlook.com.au>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[howett.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[howett.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11369-lists,linux-hwmon=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[chromium.org,kernel.org,weissschuh.net,suse.com,roeck-us.net,lwn.net,amd.com,outlook.com.au,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dustin@howett.net,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[howett.net:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid,weissschuh.net:email,howett.net:email,howett.net:dkim]
X-Rspamd-Queue-Id: 3E3A25DD25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Jan 18, 2026 at 3:46=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
> Tested on a Framework 13 AMD.

Tested on a Framework Laptop 16 (tulip, AMD AI 300) and a Chromebook
Pixel (link, 2013) as well.

For the series,

Tested-by: Dustin L. Howett <dustin@howett.net>

d

