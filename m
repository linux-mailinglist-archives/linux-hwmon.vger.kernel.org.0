Return-Path: <linux-hwmon+bounces-12863-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ivhTDScTx2lUSgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-12863-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 28 Mar 2026 00:30:47 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0951E34C497
	for <lists+linux-hwmon@lfdr.de>; Sat, 28 Mar 2026 00:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85F343015FD2
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2026 23:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB61832E743;
	Fri, 27 Mar 2026 23:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0par5Um"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6042223C51D
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 23:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654237; cv=none; b=YMaUheKvlVBH9jgcUyNQarjMmAQKCwq7EI+NVUzkIbPYH9+ZTUQeTETiwaNOAjaoeRLzRlg01DWdGHi69PlFPpphf/qLYf5TcesgvR2AsTeUfdgjyJeDiGQFezJn53lIdb5lUDxQjPRtkESWzWOWS82hwPJ5WEuN06L5UJIB0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654237; c=relaxed/simple;
	bh=1IYh1ehSH5stdfKA+xL39rjCVyvhZ8UPExTRtbfOC34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw5mifKrWUPBF21c3vaz0ME/X+/IUp6eDATa96lMrvMRA7lVMs0VUFSeDi3pQiZf0MNRLIXR9LLSj18l3RmR0hBD1aqqEgnRWl/WBOHLoeZ1OgA6kpd/d4RC7hcpMNHPV3vtXxyXpr2HYyYE7RcfNIODdJTRN/5WhUmN2Q30JRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0par5Um; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c107ef474fso4870426eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 16:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774654235; x=1775259035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqMGSTYtPFG2f7/nKCRYdOSWRxj9+go2esmsos15kCk=;
        b=C0par5UmqwpHrbfyZlxcabmdEvCr2wPULJiGpD6sTieP1MSVpnVZBfGWEa7YKol4zh
         DQGKVbAYowJLDTIiyptW6weaJbWIWNqSTluQOJjMqdIDTdUyhVko1VYUy/gejvZxuwt0
         z2QMK3XgbiqcktmmZmS+wYwAniZ6dxSKCRi1jGQpOuduEi6+w3pW/mhcMe8AFawrE0Cb
         uMpoY9Ma4O5Yj+1NwzzayzY6SuXF5n2Mt2jfJl1FX8SZV1yh2EvO5nqaPOiOQjpI7fHO
         sH2MH1UblXksdQgyl1Eky+coZeyagRMZDHu0Va1aqp5twxiUFBw6+1GttLdZBclyYNDD
         Q9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654235; x=1775259035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqMGSTYtPFG2f7/nKCRYdOSWRxj9+go2esmsos15kCk=;
        b=d8lGPHkTkAYoXGEPNhYxefqod/0H4kVRZ49A6FX+5FE5z6Yc5bof0bbEw1WA/hc1ik
         NogGNA7JuSl0tlSisjIjJIPFK9cxeTN68oBC1OpVMvQRoU5eAa2Gl7mudgYq1dsPoOej
         OV84zQEOeALKjlIBkp6KA3z7SMjiomP+8UJ5UjSrpIhDS9EgscKSlXWX45qOZpZ8A/vC
         fCQBzHN12b+BZfOSuqIRm4gXKAs45qQE+IKNEC2aYYrS4XMLSzcr7jOZdersnTm2V+ur
         9T96NiU1Dq6e1HUi0PjDdxaD9PzTogMlzTC7QJuPU+bif8oPZGRXXKbhVd3E5W++nt09
         Qezg==
X-Forwarded-Encrypted: i=1; AJvYcCVcie0ID/hI2VLbpZMw2efwBtkwCHM1TwHCqfAHrvcv2cmvzBQsC0nXfG2XqF5i2SraiEQOirjsrnyEgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZn52GN/b1+ZnNCKajKK/fWmnD342aP4V+k9rUSmp4qllFDr3
	x3ZMVsp+Wl+/EhWDwWdgOMToIkM48kI/ydlgwn2FJQb8DGeyh1krGK+Q
X-Gm-Gg: ATEYQzw7dQdj9lgujYtazvvtbE+JJuGf/5YpodIRqExPR4siTcAHvE/xEngewM8r9Rp
	aws7/QhhCg7NV0buMG+vj/vDU1diH6RgKGtVnkju2SNUFkVJpGAiUxVnlEqDIc8n3rUmnzWAvij
	tvD0k2jOm0s9O4U2pBlZlS7H21c8xqPyRSE5HwiWFuqmjgQSvfx1yVUWB8+EgpoU59Fh2bZ0eQF
	izT7tcfyiVQHfvD/60qp/8ET5MTh35Kw7kT4Z+TSw/Vt6KvrTJW7iIeKPmkygAigZFDKRpzqYWs
	ZWICrwIqJ9oBNKXGN6wuOSLfGqCmtfNzo9C/wsPBz9nfwOc+t2Uq/rUtiSaMxx97PBrAUkUwiTr
	CScOi+PCFMiqFE09CG9d2pQGJsMC7M9ilu5wv88iNjq4H0ptdByfSvXKmty9cm2ruHtC+9qvvTf
	4OXwZahoKY/0VUOvCH3eR6b512OWodJJiJhIvg
X-Received: by 2002:a05:693c:3113:b0:2ba:9381:5c7c with SMTP id 5a478bee46e88-2c185dd3447mr2526692eec.9.1774654235311;
        Fri, 27 Mar 2026 16:30:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9bd48sm661935eec.20.2026.03.27.16.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:30:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 27 Mar 2026 16:30:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
Message-ID: <7c8dcadb-7e9f-47b3-8bb7-80a0e8412837@roeck-us.net>
References: <20260327221602.18832-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327221602.18832-1-sergiomelas@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12863-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0951E34C497
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:16:02PM +0100, Sergio Melas wrote:
> This driver provides fan speed monitoring for Lenovo Yoga, Legion, and
> IdeaPad laptops by interfacing with the Embedded Controller (EC) via ACPI.
> 
> To address low-resolution sampling in Lenovo EC firmware, a Rate-Limited
> Lag (RLLag) filter is implemented. The filter ensures a consistent physical
> curve regardless of userspace polling frequency.
> 
> Hardware identification is performed via DMI-based quirk tables, which
> map specific ACPI object paths and register widths (8-bit vs 16-bit)
> deterministically.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Sashiko is happy, and I don't find anything to complain about anymore
either, so...

Applied.

Thanks,
Guenter

